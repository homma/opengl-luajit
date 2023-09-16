#!/bin/sh -x

# external module
mkdir -p ext

#### extract OpenGL and GLUT symbols

# system include path
BASE=/Library/Developer/CommandLineTools
SDK_INCLUDE=${BASE}/SDKs/MacOSX.sdk/usr/include

# framwork path
FRAMEWORK_PATH=${BASE}/SDKs/MacOSX.sdk/System/Library/Frameworks

# umbrella header file
TARGET=opengl_umbrella.h

OUTPUT=ext/glsymbol.lua
rm ${OUTPUT}

cat <<END >> ${OUTPUT}
-- this file is generated from GLUT/glut.h
-- see GLUT/glut.h and included files for copyright

local ffi = require 'ffi'

ffi.cdef [[
END

# generates cdefs from header files
clang -cc1 -ast-print \
-I ${SDK_INCLUDE} \
-F ${FRAMEWORK_PATH} \
${TARGET} \
| sed 's/_Nullable//' \
| sed 's/__attribute__((.*))//' >> ${OUTPUT}

cat <<END >> ${OUTPUT}
]]
END

#### extract opengl constants

# header file
GL_HEADER=${FRAMEWORK_PATH}/OpenGL.framework/Headers/gl.h

OUTPUT=ext/glconst.lua
rm ${OUTPUT}

cat <<END >> ${OUTPUT}
-- this file is generated from gl.h
-- see gl.h and included files for copyright

local glconst = {}
END

grep '^#define' ${GL_HEADER} \
| awk '{if($3) print("glconst." $2 " = " $3)}' >> ${OUTPUT}

cat <<END >> ${OUTPUT}
return glconst
END

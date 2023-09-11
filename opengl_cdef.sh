#!/bin/sh -x

# generates cdef file to be used by luajit ffi

# system include path
BASE=/Library/Developer/CommandLineTools
SDK_INCLUDE=${BASE}/SDKs/MacOSX.sdk/usr/include

# framwork path
FRAMEWORK_PATH=${BASE}/SDKs/MacOSX.sdk/System/Library/Frameworks

# umbrella header file
TARGET=opengl_umbrella.h

OUTPUT=opengl.cdef

# generates cdefs from header files
clang -cc1 -ast-print \
-I ${SDK_INCLUDE} \
-F ${FRAMEWORK_PATH} \
${TARGET} \
| sed 's/_Nullable//' \
| sed 's/__attribute__((.*))//' > ${OUTPUT}


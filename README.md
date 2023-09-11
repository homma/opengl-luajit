#### About

Using OpenGL from LuaJIT on macOS

#### Prerequisites

- macOS
- [clang](https://clang.llvm.org)
- [luajit](https://luajit.org) (ex. `brew install luajit`)

#### Preparation

generate the cdef file as below.

````sh
$ ./opengl_cdef.sh
````

#### Usage

````sh
$ luajit window.lua
````

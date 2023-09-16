#### About

Using OpenGL from LuaJIT on macOS

#### Prerequisites

- macOS
- [clang](https://clang.llvm.org)
- [luajit](https://luajit.org) (ex. `brew install luajit`)

#### Preparation

generate necessary files as below.

````sh
$ ./gen_opengl.sh
````

#### Usage

````sh
$ luajit vertex_array.lua
````

#### License

MIT License except files generated in ext/ directory

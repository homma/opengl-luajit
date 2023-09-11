local ffi = require 'ffi'

local M = {}

local init_ffi = function()
  -- initialize ffi
  local f = io.open('opengl.cdef', 'r')
  local cdefs = f:read 'a'
  ffi.cdef(cdefs)

  M.gl = ffi.load '/System/Library/Frameworks/OpenGL.framework/OpenGL'
  M.glut = ffi.load '/System/Library/Frameworks/GLUT.framework/GLUT'
end

local init_module = function()
  init_ffi()
end

init_module()

return M

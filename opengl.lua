local ffi = require 'ffi'

local M = {}

local init_ffi = function()
  -- initialize ffi
  require 'ext.glsymbol'

  M.gl = ffi.load '/System/Library/Frameworks/OpenGL.framework/OpenGL'
  M.glut = ffi.load '/System/Library/Frameworks/GLUT.framework/GLUT'
  M.glconst = require 'ext.glconst'
end

local init_module = function()
  init_ffi()
end

init_module()

return M

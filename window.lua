local opengl = require 'opengl'
local gl = opengl.gl
local glut = opengl.glut
local ffi = require 'ffi'

local window = {}
window.title = 'My OpenGL Window'
window.x = 200
window.y = 200
window.w = 600
window.h = 400

local display = function() end

local main = function()
  local argc = ffi.new('int[1]', 0)
  local argv = ffi.new('char *[?]', 0)
  glut.glutInit(argc, argv)

  glut.glutInitWindowPosition(window.x, window.y)
  glut.glutInitWindowSize(window.w, window.h)

  glut.glutCreateWindow(window.title)

  glut.glutDisplayFunc(display)

  glut.glutMainLoop()

  return 0
end

main()

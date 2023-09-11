local opengl = require 'opengl'
local gl = opengl.gl
local glut = opengl.glut
local ffi = require 'ffi'

local display = function() end

local main = function()
  local argc = ffi.new('int[1]', 0)
  local argv = ffi.new('char *[?]', 0)
  glut.glutInit(argc, argv)

  glut.glutInitWindowPosition(200, 200)
  glut.glutInitWindowSize(600, 400)

  local title = 'My OpenGL Window'
  glut.glutCreateWindow(title)

  glut.glutDisplayFunc(display)

  glut.glutMainLoop()

  return 0
end

main()

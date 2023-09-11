local opengl = require 'opengl'
local gl = opengl.gl
local glut = opengl.glut
local ffi = require 'ffi'

local display = function()
  print(os.date 'display: %c')
end

-- this does not work
-- local timer = function()
--   print(os.date("timer: %c"))
--   glut.glutTimerFunc(100, timer, 0)
-- end

-- need to be like below
function timer()
  print(os.date 'timer: %c')
  glut.glutTimerFunc(300, timer, 0)
end

local window = {}
window.title = 'My OpenGL Window'
window.x = 200
window.y = 200
window.w = 600
window.h = 400

local main = function()
  local argc = ffi.new('int[1]', 0)
  local argv = ffi.new 'char **'
  glut.glutInit(argc, argv)

  glut.glutInitWindowPosition(window.x, window.y)
  glut.glutInitWindowSize(window.w, window.h)

  glut.glutCreateWindow(window.title)

  glut.glutDisplayFunc(display)

  glut.glutTimerFunc(100, timer, 0)

  glut.glutMainLoop()

  return 0
end

main()

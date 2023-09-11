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

local main = function()
  local argc = ffi.new('int[1]', 0)
  local argv = ffi.new('char *[?]', 0)
  glut.glutInit(argc, argv)

  glut.glutInitWindowPosition(200, 200)
  glut.glutInitWindowSize(300, 200)

  local title = 'My OpenGL Window'
  glut.glutCreateWindow(title)

  glut.glutDisplayFunc(display)

  glut.glutTimerFunc(100, timer, 0)

  glut.glutMainLoop()

  return 0
end

main()

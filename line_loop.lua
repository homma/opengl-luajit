-- sample: GL_LINE_LOOP

local opengl = require 'opengl'
local gl = opengl.gl
local glut = opengl.glut
local glconst = opengl.glconst
local ffi = require 'ffi'

-- square
-- stylua: ignore
local s = {
  -- x, y
  { -0.7, -0.9 },
  {  0.7, -0.9 },
  {  0.7,  0.9 },
  { -0.7,  0.9 },
}

-- square vertex
-- stylua: ignore
local sv = ffi.new("float [8]", {
  -- x, y
  s[1][1], s[1][2],
  s[2][1], s[2][2],
  s[3][1], s[3][2],
  s[4][1], s[4][2],
})

local display = function()
  gl.glBegin(glconst.GL_LINE_LOOP)
  gl.glVertex2d(sv[0], sv[1])
  gl.glVertex2d(sv[2], sv[3])
  gl.glVertex2d(sv[4], sv[5])
  gl.glVertex2d(sv[6], sv[7])
  gl.glEnd()

  gl.glFlush()
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

  glut.glutMainLoop()

  return 0
end

main()

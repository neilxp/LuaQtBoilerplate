require 'qtcore'
require 'qtgui'
require 'qtwebkit'

require 'gui.MainWnd'

app = QApplication.new(select('#',...) + 1, {'lua', ...})

local wnd = MainWnd:new()
wnd:init()

-- YOUR CODE GOES HERE
app.exec()
MainWnd = {}

function MainWnd:new(o)
	o = o or {}
	setmetatable(o,self)
	self.__index = self
	return o
end


function MainWnd:init()
	-- first page
	widget = QWidget.new()
	hLayout = QVBoxLayout.new()
	widget:setLayout(hLayout)

	tabView = QTabWidget.new()
	tabView:addTab(widget, "Tab1")
	--tabView:show()

	self.w = QMainWindow.new()
	self.w:setWindowTitle("MainWnd")
	self.w:setMinimumWidth(400)
	self.w:setMinimumHeight(300)
	self.w:resize(QSize(800, 600))
	self:createMDI()
	self:createActions()
	self:createMenu()
	self:createToolbar()
	self:createStatusBar()
	
	self.w:showMaximized()
end

function MainWnd:createActions()
	self.aNew = QAction(QIcon.new("./images/new.png"), "&New", self.w)
    self.aNew:setStatusTip("create New file")
	self.aNew:connect("2triggered()", function()
		QMessageBox.information(self.w, "Create New file", "Enter your code to create new document.")
	end)
	
	self.aSave = QAction(QIcon("./images/save.png"), "&Save", self.w)
	self.aSave:setStatusTip("save document")
	self.aSave:connect("2triggered()", function()
		local fileName = QFileDialog.getSaveFileName(self.w)
		if not fileName:isEmpty() then 
			QMessageBox.information(self.w, "Selected file", fileName)
		end
	end)
	
	self.aSave = QAction(QIcon("./images/save.png"), "&Save", self.w)
	self.aSave:setStatusTip("save document")
	self.aSave:connect("2triggered()", function()
		local fileName = QFileDialog.getSaveFileName(self.w)
		if not fileName:isEmpty() then 
			QMessageBox.information(self.w, "Selected file", fileName)
		end
	end)
	
	self.aAbout = QAction("About", self.w)
	self.aAbout:connect("2triggered()", function()
		QMessageBox.about(self.w, "About", "Content here")
	end)
end

function MainWnd:createToolbar()
	self.tbMain = self.w:addToolBar("Main")
	self.tbMain:addAction(self.aNew)
	self.tbMain:addAction(self.aSave)
end

function MainWnd:createMenu()
	self.mFile = self.w:menuBar():addMenu("File")
	self.mFile:addAction(self.aNew)
	self.mFile:addAction(self.aSave)
	
	self.mHelp = self.w:menuBar():addMenu("About")
	self.mHelp:addAction(self.aAbout)
end

function MainWnd:createStatusBar()
	self.w:statusBar():showMessage("Ready")
end

function MainWnd:createMDI()
	self.mdi = QMdiArea()
	self.mdi:setHorizontalScrollBarPolicy("ScrollBarAsNeeded")
	self.mdi:setVerticalScrollBarPolicy("ScrollBarAsNeeded")
	self.w:setCentralWidget(self.mdi)
end

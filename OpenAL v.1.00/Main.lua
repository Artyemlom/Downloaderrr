local GUI = require("GUI")
local MineOSInterface = require("MineOSInterface")
local web = require("web")
local MineOSCore = require("MineOSCore")
local MineOSNetwork = require("MineOSNetwork")
local Computer = require("computer")

local mainContainer, window = MineOSInterface.addWindow(GUI.titledWindow(1, 1, 53, 3, "OpenAL", true))
local menu = window:addChild(GUI.menu(1, 3, window.width, 0xE1E1E1, 0x666666, 0x3366CC, 0xFFFFFF, nil))
oopo4 = window:addChild(GUI.layout(1, 1, window.width, window.height, 1, 1))
local ll = oopo4:setPosition(1, 1, oopo4:addChild(GUI.text(3, 2, 0x0, "OpenAL 2018   v.1.00   Developer: Artyemlom")))

menu:addItem(" Reinstall MineOS ").onTouch = function()
	web.run("https://pastebin.com/raw/0nM5b1jU")
end

menu:addItem(" Reboot ").onTouch = function()
	MineOSNetwork.broadcastComputerState(false)
	Computer.shutdown(true)
end

menu:addItem(" Power off ").onTouch = function()
	MineOSNetwork.broadcastComputerState(false)
	require("computer").shutdown()
end

menu:addItem(" Shell ").onTouch = function()
	MineOSNetwork.broadcastComputerState(false)
	MineOSInterface.mainContainer:stopEventHandling()
	MineOSInterface.clearTerminal()
end


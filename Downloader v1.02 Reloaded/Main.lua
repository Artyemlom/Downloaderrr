local GUI = require("GUI")
--local MineOSInterface = require("MineOSInterface")
--local web = require("web")
--local MineOSCore = require("MineOSCore")
local system = require("System")
local imageL = require("Image")
local component = require("component")
local filesystem = require("Filesystem")
local event = require("Event")
local number = require("Number")
local web = require("Internet")
local keyboard = require("Keyboard")
local unicode = require("Unicode")

local erro = 0
local function tryToDownload(...)
	local success, reason = web.download(...)
	if not success then
		GUI.alert(reason)
		erro = 1
	else
		erro = 0
	end
	return success
end

local mainContainer, window, menu = system.addWindow(GUI.titledWindow(1, 1, 80, 30, "Downloader"))
local menu = window:addChild(GUI.menu(1, 2, window.width, 0xE1E1E1, 0x666666, 0x3366CC, 0xFFFFFF, nil))
local localization = system.getCurrentScriptLocalization()

web.run("https://pastebin.com/raw/bV85ACLR")

oopo4 = window:addChild(GUI.layout(1, 1, window.width, window.height, 3, 1))
local ll = oopo4:setPosition(2, 1, oopo4:addChild(GUI.text(3, 2, 0x0, "Downloader 2018-2025")))
local lll = oopo4:setPosition(2, 1, oopo4:addChild(GUI.text(3, 2, 0x0, "Developers: Artyemlom")))
local llll = oopo4:setPosition(2, 1, oopo4:addChild(GUI.text(3, 2, 0x0, "v1.02 Reloaded")))

oopo4.hidden = true

local okey = 0
oopo = window:addChild(GUI.layout(1, 1, window.width, window.height, 3, 1))
oopo:setPosition(2, 1, oopo:addChild(GUI.text(1, 1, 0x0, "")))
local name = oopo:setPosition(2, 1, oopo:addChild(GUI.input(1, 1, 40, 3, 0x4d4d4d, 0xb8b8b8, 0xb8b8b8, 0x4d4d4d, 0x555555, nil, localization.nameFile, false, nil, nil, nil)))
name.onInputFinished = function(mainContainer, input, eventData, text)
	okey = okey + 1
end
local fel = oopo:setPosition(2, 1, oopo:addChild(GUI.input(1, 1, 40, 3, 0x4d4d4d, 0xb8b8b8, 0xb8b8b8, 0x4d4d4d, 0x555555, nil, localization.format, false, nil, nil, nil)))
fel.onInputFinished = function(mainContainer, input, eventData, text)
	okey = okey + 1
end
local url = oopo:setPosition(2, 1, oopo:addChild(GUI.input(1, 1, 40, 3, 0x4d4d4d, 0xb8b8b8, 0xb8b8b8, 0x4d4d4d, 0x555555, nil, localization.urlFile, false, nil, nil, nil)))
url.onInputFinished = function(mainContainer, input, eventData, text)
	okey = okey + 1
end
local filesystemChooser = oopo:setPosition(2, 1, oopo:addChild(GUI.filesystemChooser(2, 2, 40, 3, 0x4d4d4d, 0xb8b8b8, 0x808080, 0xffffff, "/MineOS/Desktop/", "OK", "Cancel", "Choose", "/")))
local baton = oopo:setPosition(2, 1, oopo:addChild(GUI.button(1, 1, 40, 3, 0xd44e4e, 0xEEEEEE, 0xfc6a6a, 0xEEEEEE, localization.DownloadFile)))
local status = oopo:setPosition(2, 1, oopo:addChild(GUI.text(3, 2, 0x1d1d1f, "None")))
local statuspro = oopo:setPosition(2, 1, oopo:addChild(GUI.progressBar(2, 2, 50, 0x4650c2, 0xEEEEEE, 0x000000, 0, true, true, "", "")))
local ok = oopo:setPosition(2, 1, oopo:addChild(GUI.button(1, 1, 30, 3, 0x588224, 0xEEEEEE, 0x94fc6a, 0xEEEEEE, localization.okkk)))
filesystemChooser:setMode(GUI.IO_MODE_OPEN, GUI.IO_MODE_DIRECTORY )
newpatch = "/MineOS/Desktop/"

filesystemChooser.onSubmit = function(patch)
	newpatch = tostring (patch)
end
ok.hidden = true
statuspro.hidden = true
status.hidden = true
	ok.onTouch = function()
		url.hidden = false
		name.hidden = false
		filesystemChooser.hidden = false
		baton.hidden = false
		statuspro.hidden = true
		status.hidden = true
		ok.hidden = true
		fel.hidden = false
		fel.text = ""
		name.text = ""
		url.text = ""
	end
  baton.onTouch = function()
		if okey == 3 then
			okey = 0
			if url then
					tryToDownload(url.text, newpatch .. name.text)
					if erro == 0 then
						url.hidden = true
						name.hidden = true
						fel.hidden = true
						filesystemChooser.hidden = true
						baton.hidden = true
						statuspro.hidden = false
						status.hidden = false
						status.text = localization.textDownload .. " " .. name.text .. "" .. localization.innput .. newpatch
						web.download(url.text, newpatch .. name.text .. fel.text)
						statuspro.value = 100
						name.text = ""
						fel.text = ""
						url.text = ""
						ok.hidden = false
						
					end
			else
				GUI.failUrl(localization.failUrl)
			end
		else
			okey = 0
			name.text = ""
			fel.text = ""
			url.text = ""
			GUI.alert(localization.failDostup)
		end	
	end
	
local okey2 = 0
oopo2 = window:addChild(GUI.layout(1, 1, window.width, window.height, 3, 1))
oopo2:setPosition(2, 1, oopo2:addChild(GUI.text(1, 1, 0x0, "")))
local name2 = oopo2:setPosition(2, 1, oopo2:addChild(GUI.input(1, 1, 40, 3, 0x4d4d4d, 0xb8b8b8, 0x888888, 0x4d4d4d, 0x555555, nil, localization.nameSkript, false, nil, nil, nil)))
name2.onInputFinished = function(mainContainer, input, eventData, text)
	okey2 = okey2 + 1
end
local url2 = oopo2:setPosition(2, 1, oopo2:addChild(GUI.input(1, 1, 40, 3, 0x4d4d4d, 0xb8b8b8, 0x888888, 0x4d4d4d, 0x555555, nil, localization.urlFile, false, nil, nil, nil)))
url2.onInputFinished = function(mainContainer, input, eventData, text)
	okey2 = okey2 + 1
end
local filesystemChooser2 = oopo2:setPosition(2, 1, oopo2:addChild(GUI.filesystemChooser(2, 2, 40, 3, 0x4d4d4d, 0xb8b8b8, 0x808080, 0xffffff, "/MineOS/Desktop/", "OK", "Cancel", "Choose", "/")))
local baton2 = oopo2:setPosition(2, 1, oopo2:addChild(GUI.button(1, 1, 40, 3, 0xd44e4e, 0xEEEEEE, 0xfc6a6a, 0xEEEEEE, localization.DownloadFile)))
local status2 = oopo2:setPosition(2, 1, oopo2:addChild(GUI.text(3, 2, 0x1d1d1f, "None")))
local statuspro2 = oopo2:setPosition(2, 1, oopo2:addChild(GUI.progressBar(2, 2, 50, 0x4650c2, 0xEEEEEE, 0x000000, 0, true, true, "", "")))
local ok2 = oopo2:setPosition(2, 1, oopo2:addChild(GUI.button(1, 1, 30, 3, 0x588224, 0xEEEEEE, 0x94fc6a, 0xEEEEEE, localization.okkk)))
ok2.hidden = true
statuspro2.hidden = true
status2.hidden = true
filesystemChooser2:setMode(GUI.IO_MODE_OPEN, GUI.IO_MODE_DIRECTORY )
filesystemChooser2.onSubmit = function(patch)
	newpatch = tostring (patch)
end
	ok2.onTouch = function()
		url2.hidden = false
		name2.hidden = false
		filesystemChooser2.hidden = false
		baton2.hidden = false
		statuspro2.hidden = true
		status2.hidden = true
		ok2.hidden = true
	end
  baton2.onTouch = function()
		if okey2 == 2 then
			okey2 = 0
			if url2 then
				tryToDownload(url2.text, newpatch .. name2.text)
				if erro == 0 then
					url2.hidden = true
					name2.hidden = true
					filesystemChooser2.hidden = true
					baton2.hidden = true
					statuspro2.hidden = false
					status2.hidden = false
					
					status2.text = localization.textDownload .. " " .. name2.text .. ".lua" .. localization.innput .. newpatch
					web.download(url2.text, newpatch .. name2.text .. ".lua")
					statuspro2.value = 100
					name2.text = ""
					url2.text = ""
					ok2.hidden = false
				end
			else
				GUI.alert(localization.failUrl)
			end
		else
			okey2 = 0
			name2.text = ""
			url2.text = ""
			GUI.alert(localization.failDostup)
		end	
	end
	oopo2.hidden = true
	
	
local okey3 = 0 
oopo3 = window:addChild(GUI.layout(1, 1, window.width, window.height, 3, 1))
oopo3:setPosition(2, 1, oopo3:addChild(GUI.text(1, 1, 0x0, "")))
local name3 = oopo3:setPosition(2, 1, oopo3:addChild(GUI.input(1, 1, 40, 3, 0x4d4d4d, 0xb8b8b8, 0xb8b8b8, 0x4d4d4d, 0x555555, nil, localization.nameApp, false, nil, nil, nil)))
local url3 = oopo3:setPosition(2, 1, oopo3:addChild(GUI.input(1, 1, 40, 3, 0x4d4d4d, 0xb8b8b8, 0xb8b8b8, 0x4d4d4d, 0x555555, nil, localization.mainFile, false, nil, nil, nil)))
local url23 = oopo3:setPosition(2, 1, oopo3:addChild(GUI.input(1, 1, 40, 3, 0x4d4d4d, 0xb8b8b8, 0xb8b8b8, 0x4d4d4d, 0x555555, nil, localization.iconFile, false, nil, nil, nil)))
local filesystemChooser3 = oopo3:setPosition(2, 1, oopo3:addChild(GUI.filesystemChooser(2, 2, 40, 3, 0x4d4d4d, 0xb8b8b8, 0x808080, 0xffffff, "/MineOS/Desktop/", "OK", "Cancel", "Choose", "/")))
local baton3 = oopo3:setPosition(2, 1, oopo3:addChild(GUI.button(1, 1, 40, 3, 0xd44e4e, 0xEEEEEE, 0xfc6a6a, 0xEEEEEE, localization.DownloadFile)))
local status3 = oopo3:setPosition(2, 1, oopo3:addChild(GUI.text(3, 2, 0x1d1d1f, "None")))
local statuspro3 = oopo3:setPosition(2, 1, oopo3:addChild(GUI.progressBar(2, 2, 50, 0x4650c2, 0xEEEEEE, 0x000000, 0, true, true, "", "")))
local ok3 = oopo3:setPosition(2, 1, oopo3:addChild(GUI.button(1, 1, 30, 3, 0x588224, 0xEEEEEE, 0x94fc6a, 0xEEEEEE, localization.okkk)))

name3.onInputFinished = function(mainContainer, input, eventData, text)
	okey3 = okey3 + 1
end
url3.onInputFinished = function(mainContainer, input, eventData, text)
	okey3 = okey3 + 1
end
url23.onInputFinished = function(mainContainer, input, eventData, text)
	okey3 = okey3 + 1
end

ok3.hidden = true
statuspro3.hidden = true
status3.hidden = true
filesystemChooser3:setMode(GUI.IO_MODE_OPEN, GUI.IO_MODE_DIRECTORY )
filesystemChooser3.onSubmit = function(patch)
	newpatch = tostring (patch)
end
	ok3.onTouch = function()
		name3.hidden = false
		url3.hidden = false
		url23.hidden = false
		filesystemChooser3.hidden = false
		baton3.hidden = false
		status3.hidden = true
		statuspro3.hidden = true
		ok3.hidden = true
	end
	
	
	baton3.onTouch = function()
		if okey3 == 3 then
			okey3 = 0
			if name3 then
				if url3 then
					if url23 then
						tryToDownload(url23.text, newpatch .. name3.text)
						tryToDownload(url3.text, newpatch .. name3.text)
						if erro == 0 then
							name3.hidden = true
							url3.hidden = true
							url23.hidden = true
							filesystemChooser3.hidden = true
							baton3.hidden = true
							status3.hidden = false
							statuspro3.hidden = false
							ok3.hidden = false
							web.download(url3.text, newpatch .. name3.text .. ".app/main.lua")
							
							status3.text = localization.textDownload .. " main.lua"
							statuspro3.value = 50
						
							web.download(url23.text, newpatch .. name3.text .. ".app/icon.pic")
							status3.text = localization.textDownload .. " icon.pic"
							statuspro3.value = 100
							name3.text = ""
							url3.text = ""
							url23.text = ""
						end
					else
						GUI.alert(localization.mainfail)
					end
				else
					GUI.alert(localization.mainfail)
				end
			else
				GUI.alert(localization.namefail)
			end
		else
			GUI.alert(localization.failDostup)
		end
	end	
	
	oopo3.hidden = true

menu:addItem(localization.enter, 0x0)


menu:addItem(localization.downSkript).onTouch = function()
	oopo.hidden = true
	oopo2.hidden = false
	oopo3.hidden = true
	oopo4.hidden = true
	name3.text = ""
	url3.text = ""
	url23.text = ""
	fel.text = ""
	name.text = ""
	url.text = ""
	name2.text = ""
	url2.text = ""
	okey = 0
	okey2 = 0
	okey3 = 0
end

menu:addItem(localization.downFile).onTouch = function()
	oopo.hidden = false
	oopo2.hidden = true
	oopo3.hidden = true
	oopo4.hidden = true
	name3.text = ""
	url3.text = ""
	url23.text = ""
	fel.text = ""
	name.text = ""
	url.text = ""
	name2.text = ""
	url2.text = ""
	okey = 0
	okey2 = 0
	okey3 = 0
end

menu:addItem(localization.downApp).onTouch = function()
	oopo.hidden = true
	oopo2.hidden = true
	oopo3.hidden = false
	oopo4.hidden = true
	name3.text = ""
	url3.text = ""
	url23.text = ""
	fel.text = ""
	name.text = ""
	url.text = ""
	name2.text = ""
	url2.text = ""
	okey = 0
	okey2 = 0
	okey3 = 0
end

menu:addItem("About").onTouch = function()
	oopo.hidden = true
	oopo2.hidden = true
	oopo3.hidden = true
	oopo4.hidden = false
	name3.text = ""
	url3.text = ""
	url23.text = ""
	fel.text = ""
	name.text = ""
	url.text = ""
	name2.text = ""
	url2.text = ""
	okey = 0
	okey2 = 0
	okey3 = 0
end
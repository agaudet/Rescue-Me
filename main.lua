require "widgets"

stage:setOrientation(Stage.LANDSCAPE_LEFT)

-- getDeviceWidth() returns the screen's height in landscape
-- getDeviceHeight() returns the screen's width in landscape
local W = application:getDeviceHeight()
local H = application:getDeviceWidth()
local scaleX = W/480
local scaleY = H/320
print("screen: " .. W .. " x " .. H)
print("scale: " .. scaleX .. ", " .. scaleY)


local background = Bitmap.new(Texture.new("grass.png"))
background:setScale(scaleX,scaleY)
stage:addChild(background)

local wallet = Bank.new(1000)
stage:addChild(wallet)
wallet:setPosition(10,10)

local widgets = Widgets.new()
widgets:setScale(scaleX,scaleY)
widgets:newWidget("animal")
widgets:newWidget("shop")
widgets:newWidget("minigames")
widgets:newWidget("statistics")
widgets:newWidget("settings")
stage:addChild(widgets)
local w = widgets.animalWidget.width
widgets.animalWidget.view:setPosition(W/10-w/2,H-widgets.animalWidget.height)
widgets.shopWidget.view:setPosition(3*W/10-w/2,H-widgets.shopWidget.height)
widgets.miniGamesWidget.view:setPosition(W/2-w/2,H-widgets.miniGamesWidget.height)
widgets.statisticsWidget.view:setPosition(7*W/10-w/2,H-widgets.statisticsWidget.height)
widgets.settingsWidget.view:setPosition(9*W/10-w/2,H-widgets.settingsWidget.height)
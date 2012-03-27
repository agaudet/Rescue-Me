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

local dog = Bitmap.new(Texture.new("dog.png"))
dog:setPosition(W/2,H/2)
stage:addChild(dog)

local wallet = Bank.new(1000)
stage:addChild(wallet)
wallet:setPosition(10,10)

local widgets = Widgets.new()
widgets:setScale(scaleX*2,scaleY*2)
widgets:newWidget("animal")
widgets:newWidget("shop")
widgets:newWidget("minigames")
widgets:newWidget("statistics")
widgets:newWidget("settings")
local w = widgets.animalWidget.width
widgets.animalWidget.view:setPosition(W/10-w/2,H-widgets.animalWidget.height)
widgets.shopWidget.view:setPosition(3*W/10-w/2,H-widgets.shopWidget.height)
widgets.miniGamesWidget.view:setPosition(W/2-w/2,H-widgets.miniGamesWidget.height)
widgets.statisticsWidget.view:setPosition(7*W/10-w/2,H-widgets.statisticsWidget.height)
widgets.settingsWidget.view:setPosition(9*W/10-w/2,H-widgets.settingsWidget.height)

local scrollableGroup = Sprite.new()
scrollableGroup.minX = -200
scrollableGroup.maxX = W-200
scrollableGroup.minY = -200
scrollableGroup.maxY = H-200
scrollableGroup:addChild(background)
scrollableGroup:addChild(dog)
stage:addChild(scrollableGroup)
stage:addChild(widgets)

local function touchToScrollBegin(event)
	local x,y = scrollableGroup:getPosition()
	scrollableGroup.x0 = event.touches[1].x-x
	scrollableGroup.y0 = event.touches[1].y-y
end

local function touchToScrollMove(event)
	scrollableGroup:setPosition(event.touches[1].x-scrollableGroup.x0,event.touches[1].y-scrollableGroup.y0)
	local x,y = scrollableGroup:getPosition()
	if x < scrollableGroup.minX then
		scrollableGroup:setPosition(scrollableGroup.minX,y)
	elseif x > scrollableGroup.maxX then
		scrollableGroup:setPosition(scrollableGroup.maxX,y)
	end
	if y < scrollableGroup.minY then
		scrollableGroup:setPosition(x,scrollableGroup.minY)
	elseif y > scrollableGroup.maxY then
		scrollableGroup:setPosition(x,scrollableGroup.maxY)
	end
end
stage:addEventListener(Event.TOUCHES_BEGIN,touchToScrollBegin,self)
stage:addEventListener(Event.TOUCHES_MOVE,touchToScrollMove,self)
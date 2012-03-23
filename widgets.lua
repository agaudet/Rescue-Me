Widgets = Core.class(Sprite)

function Widgets:init()
	self.shopWidget = {
		ID="shop",
		view=Bitmap.new(Texture.new("widget_shop.png")),
		width=32,
		height=32,
		onTouch=function(event)
			local x, y = self.shopWidget.view:getPosition()
			local w, h = self.shopWidget.width, self.shopWidget.height
			if event.x > x and event.x < x+w then
				if event.y > y and event.y < y+h then
					print("clicked shop widget")
				end
			end
		end
	}
	self.animalWidget = {
		ID="animal",
		view=Bitmap.new(Texture.new("widget_animal.png")),
		width=32,
		height=32,
		onTouch=function(event)
			local x, y = self.animalWidget.view:getPosition()
			local w, h = self.animalWidget.width, self.animalWidget.height
			if event.x > x and event.x < x+w then
				if event.y > y and event.y < y+h then
					print("clicked animal widget")
				end
			end
		end
	}
	self.miniGamesWidget = {
		ID="minigames",
		view=Bitmap.new(Texture.new("widget_minigames.png")),
		width=32,
		height=32,
		onTouch=function(event)
			local x, y = self.miniGamesWidget.view:getPosition()
			local w, h = self.miniGamesWidget.width, self.miniGamesWidget.height
			if event.x > x and event.x < x+w then
				if event.y > y and event.y < y+h then
					print("clicked minigames widget")
				end
			end
		end
	}
	self.statisticsWidget = {
		ID="statistics",
		view=Bitmap.new(Texture.new("widget_statistics.png")),
		width=32,
		height=32,
		onTouch=function(event)
			local x, y = self.statisticsWidget.view:getPosition()
			local w, h = self.statisticsWidget.width, self.statisticsWidget.height
			if event.x > x and event.x < x+w then
				if event.y > y and event.y < y+h then
					print("clicked statistics widget")
				end
			end
		end
	}
	self.settingsWidget = {
		ID="settings",
		view=Bitmap.new(Texture.new("widget_settings.png")),
		width=32,
		height=32,
		onTouch=function(event)
			local x, y = self.settingsWidget.view:getPosition()
			local w, h = self.settingsWidget.width, self.settingsWidget.height
			if event.x > x and event.x < x+w then
				if event.y > y and event.y < y+h then
					print("clicked settings widget")
				end
			end
		end
	}
end

function Widgets:newWidget(widgetID)
	if self.shopWidget.ID == widgetID then
		print("new shop widget created")
		local listener = self.shopWidget.onTouch
		self.shopWidget.view:addEventListener(Event.MOUSE_DOWN, listener)
		self:addChild(self.shopWidget.view)
	elseif self.animalWidget.ID == widgetID then
		print("new animal widget created")
		local listener = self.animalWidget.onTouch
		self.animalWidget.view:addEventListener(Event.MOUSE_DOWN, listener)
		self:addChild(self.animalWidget.view)
	elseif self.miniGamesWidget.ID == widgetID then
		print("new minigames widget created")
		local listener = self.miniGamesWidget.onTouch
		self.miniGamesWidget.view:addEventListener(Event.MOUSE_DOWN, listener)
		self:addChild(self.miniGamesWidget.view)
	elseif self.settingsWidget.ID == widgetID then
		print("new settings widget created")
		local listener = self.settingsWidget.onTouch
		self.settingsWidget.view:addEventListener(Event.MOUSE_DOWN, listener)
		self:addChild(self.settingsWidget.view)
	elseif self.statisticsWidget.ID == widgetID then
		print("new statistics widget created")
		local listener = self.statisticsWidget.onTouch
		self.statisticsWidget.view:addEventListener(Event.MOUSE_DOWN, listener)
		self:addChild(self.statisticsWidget.view)
	end
end

function Widgets:setScale(scaleX, scaleY)
	self.scaleX = scaleX
	self.scaleY = scaleY
	self.animalWidget.width = self.animalWidget.width * scaleX
	self.animalWidget.height = self.animalWidget.height * scaleX
	self.animalWidget.view:setScale(scaleX,scaleX)
	self.shopWidget.width = self.shopWidget.width * scaleX
	self.shopWidget.height = self.shopWidget.height * scaleX
	self.shopWidget.view:setScale(scaleX,scaleX)
	self.miniGamesWidget.width = self.miniGamesWidget.width * scaleX
	self.miniGamesWidget.height = self.miniGamesWidget.height * scaleX
	self.miniGamesWidget.view:setScale(scaleX,scaleX)
	self.statisticsWidget.width = self.statisticsWidget.width * scaleX
	self.statisticsWidget.height = self.statisticsWidget.height * scaleX
	self.statisticsWidget.view:setScale(scaleX,scaleX)
	self.settingsWidget.width = self.settingsWidget.width * scaleX
	self.settingsWidget.height = self.settingsWidget.height * scaleX
	self.settingsWidget.view:setScale(scaleX,scaleX)
end
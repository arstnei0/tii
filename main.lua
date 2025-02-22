DEV = true

require("requires")

local monogram = love.graphics.newFont("assets/fonts/monogram.ttf", 100)

local rect = RectangleHitbox(100, 100)
local draggable = Draggable(rect)

function love.load() end

function love.update()
	draggable:update()
end

function love.draw()
	love.graphics.setFont(monogram)
	love.graphics.print("Hello World!", 0, 0)

	love.graphics.rectangle("line", rect.pos.x, rect.pos.y, rect.width, rect.height)
end

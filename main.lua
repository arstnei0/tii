DEV = true

require("requires")

local monogram = love.graphics.newFont("assets/fonts/monogram.ttf", 100)

function love.draw()
	love.graphics.setFont(monogram)
	love.graphics.print("Hello World!", 0, 0)
end

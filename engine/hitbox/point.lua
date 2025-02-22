--- @class Point
--- @field x integer
--- @field y integer
--- @overload fun(x: integer, y: integer): Point
Point = class()

--- @param x integer
--- @param y integer
--- @return Point
function Point:new(x, y)
	local it = clone(self)
	it.x = x
	it.y = y

	return it
end

--- @overload fun(self: Point, point: Point)
--- @param x integer
--- @param y integer
function Point:move(x, y)
	if type(x) == "table" then
		self.x = x.x
		self.y = x.y
	elseif type(x) == "number" then
		self.x = x
		self.y = y
	end
end

--- @overload fun(self: Point, point: Point)
--- @param x integer
--- @param y integer
function Point:add(x, y)
	if type(x) == "table" then
		self.x = self.x + x.x
		self.y = self.y + x.y
	elseif type(x) == "number" then
		self.x = self.x + x
		self.y = self.y + y
	end
end

function Point:format()
	return string.format("(%d, %d)", self.x, self.y)
end

function Point:default()
	return Point:new(0, 0)
end

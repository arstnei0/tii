--- @class RectangleHitbox
--- @field width integer
--- @field height integer
--- @field pos Point Position of the top left corner of the hitbox.
--- @operator call:RectangleHitbox
RectangleHitbox = class()

--- @param width integer
--- @param height integer
--- @return RectangleHitbox
function RectangleHitbox:new(width, height)
	local it = clone(self)

	it.width = width
	it.height = height
	it.pos = Point:default()

	return it
end

local function if_point_in_rect(rect, x, y)
	return x >= rect.pos.x and x <= rect.pos.x + rect.width and y >= rect.pos.y and y <= rect.pos.y + rect.height
end

--- @param object Point | RectangleHitbox
--- @overload fun(self: RectangleHitbox, point: Point)
--- @overload fun(self: RectangleHitbox, rectangle_hitbox: RectangleHitbox)
function RectangleHitbox:collides(object)
	if getmetatable(object) == getmetatable(RectangleHitbox) then
		--- @cast object RectangleHitbox
		local a, b = self, object

		local ax1, ay1, ax2, ay2 = a.pos.x, a.pos.y, a.pos.x + a.width, a.pos.y + a.height
		local bx1, by1, bx2, by2 = b.pos.x, b.pos.y, b.pos.x + b.width, b.pos.y + b.height

		local x_outside = ax1 > bx2 or ax2 < bx1
		local y_outside = ay1 > by2 or ay2 < by1

		return not (x_outside or y_outside)
	elseif getmetatable(object) == getmetatable(Point) then
		--- @cast object Point
		local point = object

		return if_point_in_rect(self, point.x, point.y)
	end
end

test(function()
	-- collides with rectangle hitboxes
	local box1 = RectangleHitbox:new(100, 100)
	local box2 = RectangleHitbox:new(100, 100)

	box2.pos:add(50, 50)
	assert(box1:collides(box2))

	box2.pos:add(50, 50)
	assert(box1:collides(box2))

	box2.pos:add(50, 50)
	assert(not box1:collides(box2))

	box2.pos:move(-110, -110)
	assert(not box1:collides(box2))

	-- collides with points
	local box3 = RectangleHitbox:new(100, 100)

	assert(box3:collides(Point:new(50, 50)))
	assert(box3:collides(Point:new(100, 100)))
	assert(not box3:collides(Point:new(150, 150)))
	assert(not box3:collides(Point:new(-10, -10)))
end)

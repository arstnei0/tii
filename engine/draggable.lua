--- @class Draggable
--- @field hitbox RectangleHitbox
--- @field dragging boolean
--- @field mouse_offset Point | nil
--- @operator call:Draggable
Draggable = class()

--- @param hitbox RectangleHitbox
function Draggable:new(hitbox)
	local it = clone(self)

	it.hitbox = hitbox
	it.dragging = false
	it.mouse_offset = nil

	return it
end

--- @param mouse Point
function Draggable:update_dragging_status(mouse)
	local pressing = love.mouse.isDown(1)

	if pressing then
		if not self.dragging and self.hitbox:collides(mouse) then
			self.dragging = true
			self.mouse_offset = self.hitbox.pos:ret_sub(mouse)
		end
	else
		self.dragging = false
	end
end

--- @param mouse Point
function Draggable:update_pos(mouse)
	if self.dragging then
		self.hitbox.pos:move(mouse:ret_add(self.mouse_offset))
	end
end

--- Update where the draggable is based on whether the mouse is down or not and where the mouse is.
function Draggable:update()
	local mouse_x, mouse_y = love.mouse.getPosition()
	local mouse = Point(mouse_x, mouse_y)

	self:update_dragging_status(mouse)
	self:update_pos(mouse)
end

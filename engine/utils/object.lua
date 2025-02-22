--- Clones an object.
--- @generic T
--- @param object T
--- @return T
--- @diagnostic disable-next-line
function clone(object)
	local new_object = setmetatable({}, getmetatable(object))
	for i, v in pairs(object) do
		new_object[i] = v
	end
	return new_object
end

--- Creates a new class.
--- @generic T
--- @return T
--- @diagnostic disable-next-line
function class()
	local new_class = setmetatable({}, {
		__call = function(self, ...)
			return self:new(...)
		end,
	})

	return new_class
end

--- @diagnostic disable-next-line
function test(func)
	if DEV then
		local error = func()
		assert(error == nil, error)
	end
end

local wrap = function(func)
	return function(...)
		local params = { ... }
		return function(step)
			table.insert(params, step)
			return func(unpack(params))
		end
	end
end

local async = wrap(function(fn, callback)
	local thread = coroutine.create(fn)
	local step = nil
	step = function(...)
		local stat, ret = coroutine.resume(thread, ...)
		assert(stat, ret)
		if coroutine.status(thread) == 'dead' then
			if callback then callback(ret) end
		else
			ret(step)
		end
	end
	step()
end)

-- @param defer {function}
local await = function(defer)
	return coroutine.yield(defer)
end

return { async = async, await = await, wrap = wrap }

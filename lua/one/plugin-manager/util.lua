local M = {}

function M.parseOpts(fields, opts, plugOpts)
	plugOpts = plugOpts or {}

	for k, v in pairs(fields) do
		plugOpts[v] = opts[v]
		if type(k) == 'string' then plugOpts[v] = opts[k] end
	end

	return plugOpts
end

return M

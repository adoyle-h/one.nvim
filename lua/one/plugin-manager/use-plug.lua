local N = require('one.plugin-manager.normalize')
local util = require('one.util')

local normalizeOpts = N.normalizeOpts

-- NOTE: The plugin loaded order: "requires" plugins, "deps" plugins, current plugin.
local function usePlug(pm, loadPlug, repo, opts)
	local plugMap, plugs, userPlugins = pm.plugMap, pm.plugs, pm.userPlugins

	opts = normalizeOpts(repo, opts)
	repo = opts.repo
	local id = opts.id

	local userPluginOpts = userPlugins[id]
	if userPluginOpts then
		if opts ~= userPluginOpts then
			-- plugin default opts may equal to userPluginOpts when user require builtin plug
			opts = util.merge(opts, userPluginOpts) -- For user override existed plugin config
		end
		userPlugins[id] = nil -- Avoid repeat merge userPluginOpts. And for loading user added plugins in P.fin()
	end

	if pm.onlyPlugins then
		if vim.tbl_contains(pm.onlyPlugins, id) then
			opts.disable = false
		else
			opts.disable = true
		end
	end

	if opts.after then
		local afters = opts.after
		if type(afters) == 'string' then afters = { afters } end

		for _, after in pairs(afters) do
			if pm.isPlugDisabled(after) then
				opts.disable = true
				break
			end
		end
	end

	-- Must load dependent plugins first, then load current plugin.
	-- If current plugin is disabled, no need to load dependent plugins.
	if not opts.disable then
		local requires = {}
		for _, dep in pairs(opts.requires or {}) do
			if not dep then goto continue end

			local depPlug = usePlug(pm, loadPlug, dep)
			requires[#requires + 1] = depPlug

			if depPlug.disable then
				opts.disable = true
				opts.reason = string.format('Its required plugin "%s" is disabled', depPlug.id)
			end

			::continue::
		end
		opts.requires = requires
	end

	if not opts.disable then
		local deps = {}
		for _, dep in pairs(opts.deps or {}) do
			if not dep then goto continue end

			local depPlug = usePlug(pm, loadPlug, dep)
			deps[#deps + 1] = depPlug

			::continue::
		end
		opts.deps = deps
	end

	plugMap[id] = opts
	if opts.repoName then plugMap[opts.repoName] = opts end
	table.insert(plugs, opts)

	if opts.disable == true then
		-- disable current and required plugs
		return opts
	end

	-- Run setup before plugin is loaded.
	if opts.setup then opts.setup() end

	if repo then loadPlug(repo, opts) end

	return opts
end

return usePlug

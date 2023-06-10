local N = require('one.plugin-manager.normalize')
local util = require('one.util')

local normalizeOpts = N.normalizeOpts

-- NOTE: The plugin loaded order: "requires" plugins, "deps" plugins, current plugin.
local function usePlug(pm, loadPlug, opts)
	local plugMap, plugs, userPlugins, onlyPlugins = pm.plugMap, pm.plugs, pm.userPlugins,
		pm.onlyPlugins

	local id = opts.id

	local userPluginOpts = userPlugins[id]
	if userPluginOpts then
		if opts ~= userPluginOpts then
			-- plugin default opts may equal to userPluginOpts when user require builtin plug
			opts = util.merge(opts, userPluginOpts) -- For user override existed plugin config
		end
		userPlugins[id] = nil -- Avoid repeat merge userPluginOpts. And for loading user added plugins in P.fin()
	end

	local _onlyPlugins = false

	if onlyPlugins then
		if vim.tbl_contains(onlyPlugins, id) then
			if opts.disable == nil then opts.disable = false end
			_onlyPlugins = true
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

			dep = normalizeOpts(dep)
			if _onlyPlugins == true then table.insert(pm.onlyPlugins, dep.id) end

			local depPlug = usePlug(pm, loadPlug, dep)
			requires[#requires + 1] = depPlug

			if depPlug.disable then
				opts.disable = true
				opts.reason = string.format('Its required plugin "%s" is disabled', depPlug.id)
			end

			::continue::
		end
		opts.requires = requires

		local deps = {}
		for _, dep in pairs(opts.deps or {}) do
			if not dep then goto continue end

			dep = normalizeOpts(dep)
			if _onlyPlugins == true then table.insert(pm.onlyPlugins, dep.id) end

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

	if opts.repo then loadPlug(opts.repo, opts) end

	return opts
end

return usePlug

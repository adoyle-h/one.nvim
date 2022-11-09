return {
	['ts-parsers'] = {
		desc = 'List nvim-treesitter loaded parsers',

		command = function()
			-- TODO: list_modules is not implemented
			local mods = require('nvim-treesitter.configs').list_modules()
			local list = {}

			for i, mod in pairs(mods) do list[i] = { text = mod.name } end

			return list
		end,
	},

	plugins = {
		desc = 'List one plugins',

		command = function()
			local a = require('one')
			local list = {}

			for i, plug in pairs(a.PM.plugs) do
				local id = tostring(plug.id)
				list[#list + 1] = { text = string.format('%3d: %s', i, id), entry = { ordinal = id } }
			end

			return list
		end,
	},

}

local M = { 'one', desc = 'The functions and commands provided by one.nvim' }

local One = require('one.one')

M.commands = {
	OneReset = { One.reset, { desc = 'To remove all plugins and cached files' } },

	OneUpdate = {
		function(opts)
			One.update(opts.args)
		end,

		{
			desc = 'Update the source codes of one.nvim',
			nargs = '*',
			complete = function()
				local list = vim.tbl_keys(One.updateMap)
				list[#list + 1] = 'all'
				return list
			end,
		},
	},

	OneShowConfig = { One.showConfig, {
		desc = 'Show the merged config of one.nvim',
		nargs = '?',
		complete = function(ArgLead, CmdLine, CursorPos)
			local keys = {}
			for k, _ in pairs(One.CM.config) do
				table.insert(keys, k)
			end
			return keys
		end,
	} },

	OneShowPlugins = { One.showPlugins, { desc = 'Show plugins of one.nvim' } },
}

return M

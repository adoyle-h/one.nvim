local M = { 'one', desc = 'One.nvim functions and commands' }

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

	OneShowConfig = { One.showConfig, { desc = 'Show the merged config of one.nvim' } },

	OneShowPlugins = { One.showPlugins, { desc = 'Show plugins of one.nvim' } },
}

return M

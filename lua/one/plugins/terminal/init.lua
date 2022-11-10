local M = {
	'terminal',
	desc = 'The settings of nvim embeded terminal. See :h terminal',
	requires = { --
		require('one.plugins.terminal.neoterm'),
		require('one.plugins.terminal.float'),
	},
}

M.autocmds = {
	TermOpen = {
		callback = function()
			vim.wo.number = false
			vim.wo.rnu = false
		end,
	},
}

M.keymaps = {

	{ 'n', '<space>t', ':Telescope terminals<CR>' },

	{ 't', 'jk', '<C-\\><C-n>', { noremap = true, desc = 'Exit from terminal mode' } },

	{
		'n',
		'<leader>tn',
		function()
			local cmd = vim.fn.input { prompt = 'New Terminal: ', default = 'bash' }
			vim.cmd.FloatermNew(cmd)
		end,
		{ silent = true, desc = 'Create terminal window' },
	},

	{ 'n', '<leader>tt', ':FloatermToggle<CR>', { silent = true, desc = 'toggle terminal' } },

	{ 'n', '<leader>tk', ':FloatermKill<CR>', { silent = true, desc = 'toggle terminal' } },

	{ 'n', '<leader>ts', ':FloatermSend<CR>', { silent = true, desc = 'Send text to terminal' } },

	{
		'x',
		'<leader>ts',
		':\'<,\'>FloatermSend<CR>',
		{ silent = true, desc = 'Send selected text to terminal' },
	},
}

return M

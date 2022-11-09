local M = { 'keymap.copy-paste', desc = 'Copy&Paste' }

M.keymaps = {

	{ 'n', '<leader>y', '"+yy', { noremap = true, desc = 'copy current line into system clipboard' } },
	{ 'v', '<leader>y', '"+y', { noremap = true, desc = 'copy selected text into system clipboard' } },

	{
		'n',
		'Y',
		'y$',
		{ noremap = true, desc = 'y$ -> Y Make Y behave like other capitals: D, C etc...' },
	},

	{ { 'n', 'x' }, '<leader>p', '"0p', { noremap = true, desc = 'paste from vim clipboard' } },

	{ { 'n', 'x' }, '<leader>P', '"*p', { noremap = true, desc = 'paste from system clipboard' } },

	{ { 'n', 'x' }, '<M-p>', ':set paste!<CR>', { silent = false, desc = 'toggle paste mode' } },

}

return M

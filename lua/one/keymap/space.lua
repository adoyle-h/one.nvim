local M = { 'keymap.space', desc = 'Insert spaces or newline Keymap' }

M.keymaps = {

	{
		'n',
		'<space><space>',
		'a<space><esc>',
		{ noremap = true, silent = true, desc = 'insert a space at right position of cursor' },
	},

	{
		'n',
		']<space>',
		'a<space><esc>',
		{ noremap = true, silent = true, desc = 'insert a space at right position of cursor' },
	},

	{
		'n',
		'[<space>',
		'i<space><esc>',
		{ noremap = true, silent = true, desc = 'insert a space at left position of cursor' },
	},

	{ 'n', '<C-k>', ':put! =\'\'<CR>j', { silent = true, desc = 'add a blank before current line' } },

	{ 'n', '<C-j>', ':put =\'\'<CR>k', { silent = true, desc = 'add a blank after current line' } },

	{
		'n',
		'K',
		'i<Enter><Esc>',
		{ noremap = true, silent = true, desc = 'split line from current cursor position' },
	},

}

return M

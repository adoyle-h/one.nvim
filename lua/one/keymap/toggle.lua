local M = { 'keymap.toggle', desc = 'Toggle Keymaps' }

M.keymaps = {
	{
		'n',
		'<leader>N',
		function()
			vim.opt.relativenumber = not vim.o.relativenumber
		end,
		{ silent = true, desc = 'toggle relative/absolute number gutter' },
	},

	{
		'n',
		'<leader>L',
		':set relativenumber! number!<CR>',
		{ silent = true, desc = 'toggle linenumber gutter' },
	},

	{ 'n', '<leader>l', ':set list!<CR>', { silent = true, desc = 'toggle invisible characters' } },

	{
		'n',
		'<leader>so',
		':let &scrolloff=999-&scrolloff<CR>',
		{ silent = true, desc = 'toggle scrolloff' },
	},

	{
		'n',
		'<leader>sp',
		':set invspell invspell?<CR>',
		{ silent = true, desc = 'toggle spell-checking' },
	},
}

return M

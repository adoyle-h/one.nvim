local M = { 'keymap.search', desc = 'search keymaps' }

M.keymaps = {

	{
		'n',
		'<C-n>',
		'*',
		{
			noremap = true,
			silent = true,
			desc = 'Search word under cursor (with "<" and ">" around the word)',
		},
	},

	{
		'n',
		'<C-p>',
		'#',
		{
			noremap = true,
			silent = true,
			desc = 'Reversed search word under cursor (with "<" and ">" around the word)',
		},
	},

	{
		'n',
		'g<C-n>',
		'g*',
		{
			noremap = true,
			silent = true,
			desc = 'Search word under cursor (without "<" and ">" around the word)',
		},
	},

	{
		'n',
		'g<C-p>',
		'g#',
		{
			noremap = true,
			silent = true,
			desc = 'Reversed search word under cursor (without "<" and ">" around the word)',
		},
	},

	{ 'n', '<leader>C', ':let @/ = ""<CR>', { silent = true, desc = 'Clear search' } },

	-- {
	-- 	'n',
	-- 	'<leader>h',
	-- 	':set hlsearch! hlsearch?<CR>',
	-- 	{ silent = true, desc = 'Toggle highlighted search' },
	-- },
}

return M

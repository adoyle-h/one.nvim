return {
	'thinca/vim-visualstar',
	desc = 'Enable <C-n> search in visual mode',

	keymaps = {
		{ 'x', '<C-n>', '<Plug>(visualstar-*)', { silent = true } },
		{ 'x', '<C-p>', '<Plug>(visualstar-#)', { silent = true } },
		{ 'x', 'g<C-n>', '<Plug>(visualstar-g*)', { silent = true } },
		{ 'x', 'g<C-p>', '<Plug>(visualstar-g#)', { silent = true } },
	},

	config = function()
		vim.g.visualstar_no_default_key_mappings = 0
	end,
}

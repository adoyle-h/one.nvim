local M = { 'keymap.jump', desc = 'Jump Keymaps' }

M.keymaps = {
	{
		'n',
		'g]',
		'<C-i>', -- Because <C-i> is synonymous to <Tab> in nvim. I don't know the reason. :h tui-input
		{ noremap = true, silent = true, desc = 'jump reverse to previous cursor position' },
	},

	{ 'n', 'g[', '<C-o>', { noremap = true, silent = true, desc = 'jump to previous cursor position' } },
}

return M

local M = { 'keymap.window', desc = 'window keymaps' }

M.keymaps = {
	{ 'n', '<C-w>t', '<C-w>T', { noremap = true, desc = 'move current window to new tab' } },

	{ 'n', '<C-w><', '<C-w>1<<C-w>', { remap = true, desc = 'adjust window border to left (1 space)' } },

	{ 'n', '<C-w>>', '<C-w>1><C-w>',
   { remap = true, desc = 'adjust window border to right (1 space)' } },

	{ 'n', '<C-w>+', '<C-w>1+<C-w>', { remap = true, desc = 'increment window height (1 space)' } },
	{ 'n', '<C-w>-', '<C-w>1-<C-w>', { remap = true, desc = 'decrement window height (1 space)' } },

	{ 'n', '<C-w>H', '<C-w>5<<C-w>',
   { remap = true, desc = 'adjust window border to left (5 spaces)' } },

	{
		'n',
		'<C-w>L',
		'<C-w>5><C-w>',
		{ remap = true, desc = 'adjust window border to right (5 spaces)' },
	},

	{ 'n', '<C-w>J', '<C-w>3+<C-w>', { remap = true, desc = 'increment window height (3 spaces)' } },
	{ 'n', '<C-w>K', '<C-w>3-<C-w>', { remap = true, desc = 'decrement window height (3 spaces)' } },

	{ 'n', '<C-w><C-L>', '<C-w>L', { noremap = true, desc = 'move current buffer to right' } },
	{ 'n', '<C-w><C-H>', '<C-w>H', { noremap = true, desc = 'move current buffer to left' } },
	{ 'n', '<C-w><C-J>', '<C-w>J', { noremap = true, desc = 'move current buffer to bottom' } },
	{ 'n', '<C-w><C-K>', '<C-w>K', { noremap = true, desc = 'move current buffer to top' } },

	{ 'n', '<C-w>\\', ':new<CR>', { desc = 'create new buffer horizontally' } },
	{ 'n', '<C-w>|', ':vnew<CR>', { desc = 'create new buffer vertically' } },
	{ 'n', '<C-w>N', ':vnew<CR>', { desc = 'create new buffer vertically' } },

	{ 'n', '<M-w>', '<C-w>w', { noremap = true, desc = 'next buffer in window' } },
	{ 'n', '<M-W>', '<C-w>W', { noremap = true, desc = 'previous buffer in window' } },
}

return M

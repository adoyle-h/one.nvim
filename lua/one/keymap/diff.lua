local M = { 'keymap.diff', disable = not vim.fn.has('diff'), desc = 'diff keymaps' }

M.keymaps = {
	{ 'n', '<leader>df', ':diffthis<CR>', { desc = 'diff this' } },
	{ 'n', '<leader>do', ':diffoff<CR>', { desc = 'diff off' } },
	{ 'n', '<leader>d1', ':diffget LOCAL<CR>', { desc = 'Diff Mode: use local code' } },
	{ 'n', '<leader>d2', ':diffget REMOTE<CR>', { desc = 'Diff Mode: use remote code' } },
	{ 'n', '<leader>d3', ':diffget BASE<CR>', { desc = 'Diff Mode: use base code' } },
}

return M

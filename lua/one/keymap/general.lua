local M = { 'keymap.general', desc = 'General Keymaps' }

M.keymaps = {
	{ 'n', '<leader>w', ':w<CR>', { silent = true, desc = 'save current buffer to disk' } },

	{ 'n', '<leader>e', ':e<CR>', { silent = true, desc = 'refresh current buffer' } },

	{ 'n', '<F1>', ':h<CR>', { noremap = true, silent = true, desc = 'Open vim help document' } },

	{ 'n', 'Q', '<NOP>', { noremap = true, silent = true, desc = 'disable Ex mode' } },

	{ 'n', 't', 'xp', { noremap = true, silent = true, desc = 'swap adjacent characters' } },

	{ 'n', '<leader>sa', 'ggVG', { noremap = true, silent = true, desc = 'select all texts' } },

	{ 'v', '.', ':normal .<CR>', { silent = true, desc = 'enable . command in visual mode' } },

	{ 'n', 'U', '<C-r>', { noremap = true, silent = true, desc = 'remap U to <C-r> for easier redo' } },

	{ 'n', '<M-g>', ':echo expand("%:p")<CR>', { silent = true, desc = 'show absolute file path' } },

	{ 'i', '<M-CR>', '<ESC>o', { noremap = true, silent = true, desc = 'move cursor to next line' } },

	{ 'i', '<C-c>', '<ESC>', { noremap = true, silent = true } }, -- Fix: https://github.com/neovim/neovim/issues/16416
}

return M

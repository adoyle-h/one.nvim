local M = {
	'keymap.editline',

	desc = 'Emacs Editline in vim insert mode',

	requires = { 'linty-org/readline.nvim' },
}

M.keymaps = function()
	local readline = require('readline')
	local opts = { noremap = true, silent = true }

	return {
		-- { 'i', '<C-a>', '<Esc>I', opts },
		-- { 'i', '<C-e>', '<Esc>A', opts },
		-- { 'i', '<C-b>', '<Esc>ha', opts },
		-- { 'i', '<C-f>', '<Esc>la', opts },
		-- { 'i', '<M-b>', '<Esc>bi', opts },
		-- { 'i', '<M-f>', '<Esc>Ea', opts },
		-- { 'i', '<M-d>', '<Esc>dwa', opts },
		-- { 'i', '<C-d>', '<Esc>dla', opts },
		-- { 'i', '<C-w>', '<Esc>bdei', opts },
		-- { 'i', '<C-k>', '<Esc>Da', opts },
		-- { 'i', '<C-u>', '<Esc>dl0i', opts },

		{ '!', '<C-k>', readline.kill_line, opts },
		{ '!', '<C-u>', readline.backward_kill_line, opts },
		{ '!', '<C-w>', readline.unix_word_rubout, opts },
		{ '!', '<M-d>', readline.kill_word, opts },
		{ '!', '<C-d>', '<Delete>', opts }, -- delete-char
		{ '!', '<C-a>', readline.beginning_of_line, opts },
		{ '!', '<C-e>', readline.end_of_line, opts },
		{ '!', '<M-left>', readline.backward_word, opts },
		{ '!', '<M-right>', readline.forward_word, opts },
		{ '!', '<M-f>', readline.forward_word, opts },
		{ '!', '<M-b>', readline.backward_word, opts },
		{ '!', '<C-f>', '<Right>', opts }, -- forward-char
		{ '!', '<C-b>', '<Left>', opts }, -- backward-char
		{ '!', '<M-BS>', readline.backward_kill_word, opts },
		{ '!', '<C-h>', '<BS>', opts }, -- backward-delete-char
	}
end

return M

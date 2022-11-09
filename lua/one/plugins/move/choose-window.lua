-- It does not support gui
return {
	't9md/vim-choosewin',
	desc = 'window/tab selector',
	keymaps = { { 'n', '-', '<Plug>(choosewin)', { desc = 'choose window', silent = true } } },

	config = function()
		-- tmux-like overlay
		vim.g.choosewin_overlay_enable = 0
		vim.g.choosewin_statusline_replace = 1
		vim.g.choosewin_tabline_replace = 0 -- don't replace tabline
		vim.g.choosewin_overlay_shade = 0
		vim.g.choosewin_blink_on_land = 0 -- don't blink at land
		vim.g.choosewin_color_overlay = { cterm = { 33, 33 } }
		vim.g.choosewin_color_overlay_current = { cterm = { 196, 196 } }
		vim.g.choosewin_label_padding = 5
		vim.g.choosewin_color_bg = 234
		vim.g.choosewin_color_other = { cterm = { vim.g.choosewin_color_bg, 0 } }
		vim.g.choosewin_color_label = { cterm = { vim.g.choosewin_color_bg, 33 } }
		vim.g.choosewin_color_label_current = { cterm = { vim.g.choosewin_color_bg, 196 } }
		vim.g.choosewin_label = 'QWEASDZXC'
		vim.g.choosewin_tablabel = '1234567890'
		vim.g.choosewin_keymap = {
			['0'] = '<NOP>',
			['['] = 'tab_prev',
			[']'] = 'tab_next',
			['$'] = '<NOP>',
			x = '<NOP>',
			[';'] = '<NOP>',
			['-'] = 'previous',
			s = 'swap',
			S = 'swap_stay',
			['<CR>'] = 'win_land',
			h = 'tab_first',
			k = 'tab_prev',
			j = 'tab_next',
			l = 'tab_last',
		}
	end,
}

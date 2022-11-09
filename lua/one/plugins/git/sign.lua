local M = {
	'lewis6991/gitsigns.nvim',
	desc = 'Vim gutter sign and git blame float window',
	config = function(config)
		require('gitsigns').setup(config.gitsigns)
	end,
}

M.highlights = function(config)
	local colors = config.colors
	local addBG = '#264618'
	local delBG = '#741313'
	local chBG = '#464018'

	return {
		GitSignsCurrentLineBlame = { fg = colors.grey, bg = colors.cursorLineNrBG, italic = true },
		-- For word diff in previews
		GitSignsAddInline = { bg = addBG },
		GitSignsChangeInline = { bg = chBG },
		GitSignsDeleteInline = { bg = delBG },
		-- For word diff in buffer
		GitSignsAddLnInline = { bg = addBG },
		GitSignsChangeLnInline = { bg = chBG },
		GitSignsDeleteLnInline = { bg = delBG },
		-- For word diff in virtual lines (e.g. show_deleted)
		GitSignsAddLnVirtLnInLine = { bg = addBG },
		GitSignsChangeVirtLnInLine = { bg = chBG },
		GitSignsDeleteVirtLnInLine = { bg = delBG },
	}
end

M.defaultConfig = {
	'gitsigns',
	{
		signs = {
			untracked = { --
				hl = 'GitSignsAdd',
				text = '┃',
				numhl = 'GitSignsAddNr',
				linehl = 'GitSignsAddLn',
			},
			add = { --
				hl = 'GitSignsAdd',
				text = '┃',
				numhl = 'GitSignsAddNr',
				linehl = 'GitSignsAddLn',
			},
			change = {
				hl = 'GitSignsChange',
				text = '┃',
				numhl = 'GitSignsChangeNr',
				linehl = 'GitSignsChangeLn',
			},
			delete = {
				hl = 'GitSignsDelete',
				text = '_',
				numhl = 'GitSignsDeleteNr',
				linehl = 'GitSignsDeleteLn',
			},
			topdelete = {
				hl = 'GitSignsDelete',
				text = '‾',
				numhl = 'GitSignsDeleteNr',
				linehl = 'GitSignsDeleteLn',
			},
			changedelete = {
				hl = 'GitSignsChange',
				text = '┃',
				numhl = 'GitSignsChangeNr',
				linehl = 'GitSignsChangeLn',
			},
		},
		signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
		numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
		linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
		word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
		watch_gitdir = { interval = 1000, follow_files = true },
		attach_to_untracked = true,
		current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
			delay = 100,
			ignore_whitespace = false,
		},
		current_line_blame_formatter = '[<author_time:%Y/%m/%d %H:%M:%S> <author>] <summary>',
		sign_priority = 6,
		update_debounce = 100,
		status_formatter = nil, -- Use default
		max_file_length = 40000, -- Disable if file is longer than this (in lines)
		preview_config = {
			-- Options passed to nvim_open_win
			border = 'single',
			style = 'minimal',
			relative = 'cursor',
			row = 0,
			col = 1,
		},
		yadm = { enable = false },
		-- on_attach = function(bufnr) end,
	},

}

M.keymaps = function()
	local gs = require('gitsigns')

	return {
		-- Navigation
		{
			'n',
			']g',
			function()
				if vim.wo.diff then return ']c' end
				vim.schedule(function()
					gs.next_hunk()
				end)
				return '<Ignore>'
			end,
			{ expr = true },
		},

		{
			'n',
			'[g',
			function()
				if vim.wo.diff then return '[c' end
				vim.schedule(function()
					gs.prev_hunk()
				end)
				return '<Ignore>'
			end,
			{ expr = true },
		},

		-- Actions
		{ { 'n', 'v' }, '<leader>gs', ':Gitsigns stage_hunk<CR>', { desc = 'stage hunk' } },
		{ { 'n', 'v' }, '<leader>gr', ':Gitsigns reset_hunk<CR>', { desc = 'reset hunk' } },
		{ 'n', '<leader>G', ':Gitsigns<CR>' },
		{ 'n', '<leader>gS', gs.stage_buffer, { desc = 'stage buffer' } },
		{ 'n', '<leader>gu', gs.undo_stage_hunk, { desc = 'undo staged hunk' } },
		{ 'n', '<leader>gR', gs.reset_buffer, { desc = 'reset buffer' } },
		{ 'n', '<leader>gp', gs.preview_hunk, { desc = 'preview hunk' } },

		{
			'n',
			'<leader>gb',
			function()
				gs.blame_line { full = true }
			end,
			{ desc = 'blame current line' },
		},

		{ 'n', '<leader>gB', gs.toggle_current_line_blame, { desc = 'toggle float blame line ' } },

		{
			'n',
			'<leader>gd',
			function()
				gs.diffthis('~')
			end,
			{ desc = 'diff this with HEAD~ ' },
		},

		{ 'n', '<leader>gD', gs.toggle_deleted, { desc = 'toggle deleted text' } },

		-- Text object
		-- {{ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>'},
	}
end

return M

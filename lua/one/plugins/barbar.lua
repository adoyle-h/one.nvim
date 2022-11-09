local M = {
	'romgrk/barbar.nvim',

	requires = { 'tiagovla/scope.nvim' },

	config = function(config)
		-- Temp Fix: buffers per tab
		-- see https://github.com/akinsho/bufferline.nvim#how-do-i-see-only-buffers-per-tab
		require('scope').setup()

		require('bufferline').setup(config.barbar)
	end,
}

M.keymaps = function()
	local modes = { 'n', 'c', 'v' }
	local opts = { noremap = true, silent = true }

	return {
		-- Move to previous/next
		{ modes, '<M-[>', '<Cmd>BufferPrevious<CR>', opts },
		{ modes, '<M-]>', '<Cmd>BufferNext<CR>', opts },
		-- Re-order to previous/next
		{ modes, '<M-{>', '<Cmd>BufferMovePrevious<CR>', opts },
		{ modes, '<M-}>', '<Cmd>BufferMoveNext<CR>', opts },
		-- Goto buffer in position...
		{ modes, '<leader>1', '<Cmd>BufferGoto 1<CR>', opts },
		{ modes, '<leader>2', '<Cmd>BufferGoto 2<CR>', opts },
		{ modes, '<leader>3', '<Cmd>BufferGoto 3<CR>', opts },
		{ modes, '<leader>4', '<Cmd>BufferGoto 4<CR>', opts },
		{ modes, '<leader>5', '<Cmd>BufferGoto 5<CR>', opts },
		{ modes, '<leader>6', '<Cmd>BufferGoto 6<CR>', opts },
		{ modes, '<leader>7', '<Cmd>BufferGoto 7<CR>', opts },
		{ modes, '<leader>8', '<Cmd>BufferGoto 8<CR>', opts },
		{ modes, '<leader>9', '<Cmd>BufferGoto 9<CR>', opts },
		{ modes, '<leader>0', '<Cmd>BufferLast<CR>', opts },
		-- Pin/unpin buffer
		{ modes, '<leader>bp', '<Cmd>BufferPin<CR>', opts },
		-- Close buffer
		{ modes, '<leader>bc', '<Cmd>BufferClose<CR>', opts },
		-- Wipeout buffer
		--                 :BufferWipeout
		-- Close commands
		--                 :BufferCloseAllButCurrent
		--                 :BufferCloseAllButPinned
		--                 :BufferCloseAllButCurrentOrPinned
		--                 :BufferCloseBuffersLeft
		--                 :BufferCloseBuffersRight
		-- Magic buffer-picking mode
		{ modes, '<leader>bP', '<Cmd>BufferPick<CR>', opts },
	}
end

M.defaultConfig = {
	'barbar',
	{
		-- Set barbar's options
		-- Enable/disable animations
		animation = false,

		-- Enable/disable auto-hiding the tab bar when there is a single buffer
		auto_hide = false,

		-- Enable/disable current/total tabpages indicator (top right corner)
		tabpages = true,

		-- Enable/disable close button
		closable = true,

		-- Enables/disable clickable tabs
		--  - left-click: go to buffer
		--  - middle-click: delete buffer
		clickable = true,

		-- Excludes buffers from the tabline
		exclude_ft = { 'alpha' },
		exclude_name = {},

		-- Show every buffer
		hide = { current = false, inactive = false, visible = false },

		-- Enable/disable icons
		-- if set to 'numbers', will show buffer index in the tabline
		-- if set to 'both', will show buffer index and icons in the tabline
		icons = 'numbers',

		-- If set, the icon color will follow its corresponding buffer
		-- highlight group. By default, the Buffer*Icon group is linked to the
		-- Buffer* group (see Highlighting below). Otherwise, it will take its
		-- default value as defined by devicons.
		icon_custom_colors = false,

		-- Configure icons on the bufferline.
		icon_separator_active = '▎',
		icon_separator_inactive = ' ',
		icon_close_tab = '',
		icon_close_tab_modified = '●', -- '*'
		icon_pinned = '車',

		-- If true, new buffers will be inserted at the start/end of the list.
		-- Default is to insert after current buffer.
		insert_at_end = false,
		insert_at_start = false,

		-- Sets the maximum padding width with which to surround each tab
		maximum_padding = 1,

		-- Sets the minimum padding width with which to surround each tab
		minimum_padding = 1,

		-- Sets the maximum buffer name length.
		maximum_length = 20,

		-- If set, the letters for each buffer in buffer-pick mode will be
		-- assigned based on their name. Otherwise or in case all letters are
		-- already assigned, the behavior is to assign letters in order of
		-- usability (see order below)
		semantic_letters = true,

		-- New buffer letters are assigned in this order. This order is
		-- optimal for the qwerty keyboard layout but might need adjustement
		-- for other layouts.
		letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',

		-- Sets the name of unnamed buffers. By default format is "[Buffer X]"
		-- where X is the buffer number. But only a static string is accepted here.
		no_name_title = nil,
	},
}

M.highlights = function(config)
	local c = config.colors
	local selectedBG = '#1b2430'
	local bufferBG = '#12151a'
	local blue = c.blue
	local orange = c.orange

	return {
		-- format: "Buffer" + status + part
		-- status:
		--     *Current: current buffer
		--     *Visible: visible but not current buffer
		--    *Inactive: invisible but not current buffer
		-- part:
		--        *Icon: filetype icon
		--       *Index: buffer index
		--         *Mod: when modified
		--        *Sign: the separator between buffers
		--      *Target: letter in buffer-picking mode

		BufferCurrent = { fg = blue, bg = selectedBG },
		BufferCurrentIndex = { link = 'BufferCurrent' },
		BufferCurrentMod = { fg = c.yellow, bg = selectedBG },
		BufferCurrentSign = { link = 'BufferCurrent' },
		BufferCurrentTarget = { fg = orange, bg = selectedBG, bold = true },
		BufferVisible = { fg = c.grey, bg = bufferBG },
		BufferVisibleIndex = { link = 'BufferVisible' },
		BufferVisibleMod = { fg = c.yellow, bg = bufferBG },
		BufferVisibleSign = { link = 'BufferVisible' },
		BufferVisibleTarget = { fg = orange, bg = bufferBG, bold = true },
		BufferInactive = { fg = c.grey, bg = bufferBG },
		BufferInactiveIndex = { link = 'BufferInactive' },
		BufferInactiveMod = { fg = c.yellow, bg = bufferBG },
		BufferInactiveSign = { link = 'BufferInactive' },
		BufferInactiveTarget = { fg = orange, bg = bufferBG, bold = true },
		BufferTabpages = { bg = bufferBG, bold = true },
		BufferTabpageFill = { bg = bufferBG },

		BufferCurrentIcon = { link = 'BufferCurrent' },
		BufferVisibleIcon = { link = 'BufferVisible' },
		BufferInactiveIcon = { link = 'BufferInactive' },
		BufferOffset = { link = 'BufferTabpageFill' },

	}
end

return M

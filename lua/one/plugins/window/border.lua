return {
	'nvim-zh/colorful-winsep.nvim',

	config = function(config)
		require('colorful-winsep').setup(config.window.border)
	end,

	defaultConfig = function(config)
		local c = config.colors
		return {
			{ 'window', 'border' },
			{
				-- highlight for Window separator
				highlight = { guifg = c.blue, guibg = c.black },
				-- timer refresh rate
				interval = 30,
				-- This plugin will not be activated for filetype in the following table.
				no_exec_files = { 'packer', 'vim-plug', 'TelescopePrompt', 'mason' },
				-- Symbols for separator lines, the order: horizontal, vertical, top left, top right, bottom left, bottom right.
				symbols = { '━', '┃', '┏', '┓', '┗', '┛' },
				-- close_event = function()
				-- 	-- Executed after closing the window separator
				-- end,
				-- create_event = function()
				-- 	-- Executed after creating the window separator
				-- end,
			},
		}
	end,
}

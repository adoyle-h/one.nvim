local config = require('one.config').config
local colors = config.colors

return {
	-- 's1n7ax/nvim-window-picker',
	-- tag = 'v1.*',
	-- TODO: Wait https://github.com/s1n7ax/nvim-window-picker/pulls?q=is%3Aopen+is%3Apr+author%3Aadoyle-h
	'adoyle-h/nvim-window-picker',
	branch = 'a',

	config = function()
		require'window-picker'.setup(config['window-picker'])
	end,

	defaultConfig = {
		'window-picker',
		{
			-- when there is only one window available to pick from, use that window
			-- without prompting the user to select
			autoselect_one = true,

			-- whether you want to include the window you are currently on to window
			-- selection or not
			include_current_win = true,

			-- when you go to window selection mode, status bar will show one of
			-- following letters on them so you can use that letter to select the window
			selection_chars = 'FJDKSLA;CMRUEIWOQP',

			-- You can change the display string in status bar.
			-- It supports '%' printf style. Such as `return char .. ': %f'` to display
			-- buffer filepath. See :h 'stl' for details.
			selection_display = function(char)
				return string.format('[%s] %s', char, '%f')
			end,

			-- whether you want to use winbar instead of the statusline
			-- "always" means to always use winbar,
			-- "never" means to never use winbar
			-- "smart" means to use winbar if cmdheight=0 and statusline if cmdheight > 0
			use_winbar = 'smart', -- "always" | "never" | "smart"

			-- if you want to manually filter out the windows, pass in a function that
			-- takes two parameters. you should return window ids that should be
			-- included in the selection
			-- EX:-
			-- function(window_ids, filters)
			--    -- filter the window_ids
			--    -- return only the ones you want to include
			--    return {1000, 1001}
			-- end
			filter_func = nil,

			-- following filters are only applied when you are using the default filter
			-- defined by this plugin. if you pass in a function to "filter_func"
			-- property, you are on your own
			filter_rules = {
				-- filter using buffer options
				bo = {
					-- if the file type is one of following, the window will be ignored
					filetype = {
						'TelescopePrompt',
						'TelescopeResults',
						-- 'alpha', -- Do not ingore alpha, it will lead to neo-tree cannot open file in dashboard
						'lsp-installer',
						'null-ls-info',
						'lspinfo',
						'nerdtree',
						'NvimTree',
						'neo-tree',
						'notify',
						'aerial',
						'Mundo',
						'mason',
						'man',
						'PlenaryTestPopup',
					},

					-- if the buffer type is one of following, the window will be ignored
					-- buftype = { 'terminal' },
					buftype = {},
				},

				-- filter using window options
				wo = {},

				-- if the file path contains one of following names, the window
				-- will be ignored
				file_path_contains = {},

				-- if the file name contains one of following names, the window will be
				-- ignored
				file_name_contains = {},
			},

			-- the foreground (text) color of the picker
			fg_color = colors.black,

			-- if you have include_current_win == true, then current_win_hl_color will
			-- be highlighted using this background color
			current_win_hl_color = colors.blue,

			-- all the windows except the curren window will be highlighted using this
			-- color
			other_win_hl_color = colors.green,
		},
	},

	keymaps = {
		{
			'n',
			'-',
			function()
				local picker = require('window-picker')
				local picked_window_id = picker.pick_window() or vim.api.nvim_get_current_win()
				vim.api.nvim_set_current_win(picked_window_id)
			end,
			{ desc = 'Pick a window' },
		},
	},
}

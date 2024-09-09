local config = require('one.config').config
local colors = config.colors

return {
	's1n7ax/nvim-window-picker',
	tag = '2.*',

	config = function()
		require 'window-picker'.setup(config['window-picker'])
	end,

	defaultConfig = {
		'window-picker',
		{
			-- type of hints you want to get
			-- following types are supported
			-- 'statusline-winbar' | 'floating-big-letter'
			-- 'statusline-winbar' draw on 'statusline' if possible, if not 'winbar' will be
			-- 'floating-big-letter' draw big letter on a floating window used
			hint = 'statusline-winbar',

			-- when you go to window selection mode, status bar will show one of
			-- following letters on them so you can use that letter to select the window
			selection_chars = 'FJDKSLA;CMRUEIWOQP',


			-- This section contains picker specific configurations
			picker_config = {
				statusline_winbar_picker = {
					-- You can change the display string in status bar.
					-- It supports '%' printf style. Such as `return char .. ': %f'` to display
					-- buffer file path. See :h 'stl' for details.
					selection_display = function(char, windowid)
						return string.format('  [%s] %s', char, '%f')
					end,

					-- whether you want to use winbar instead of the statusline
					-- "always" means to always use winbar,
					-- "never" means to never use winbar
					-- "smart" means to use winbar if cmdheight=0 and statusline if cmdheight > 0
					use_winbar = 'smart', -- "always" | "never" | "smart"
				},

				floating_big_letter = {
					-- window picker plugin provides bunch of big letter fonts
					-- fonts will be lazy loaded as they are being requested
					-- additionally, user can pass in a table of fonts in to font
					-- property to use instead

					font = 'ansi-shadow', -- ansi-shadow |
				},
			},

			-- whether to show 'Pick window:' prompt
			show_prompt = true,

			-- prompt message to show to get the user input
			prompt_message = 'Pick a window',

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

				-- when there is only one window available to pick from, use that window
				-- without prompting the user to select
				autoselect_one = true,

				-- whether you want to include the window you are currently on to window
				-- selection or not
				include_current_win = false,

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
						'neo-tree-popup',
						'neo-tree-preview',
						'NvimSeparator', -- defined in colorful-winsep.nvim
						'notify',
						'noice',
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

				-- if the file path contains one of following names, the window will be ignored
				file_path_contains = {},

				-- if the file name contains one of following names, the window will be ignored
				file_name_contains = {},
			},

			-- You can pass in the highlight name or a table of content to set as
			-- highlight
			highlights = {
				statusline = {
					focused = {
						fg = colors.black,
						bg = colors.blue,
						bold = true,
					},
					unfocused = {
						fg = colors.black,
						bg = colors.green,
						bold = true,
					},
				},

				winbar = {
					focused = {
						fg = colors.black,
						bg = colors.blue,

						bold = true,
					},
					unfocused = {
						fg = colors.black,
						bg = colors.green,
						bold = true,
					},
				},
			},
		},
	},

	keymaps = {
		{
			'n',
			'-',
			function()
				local picker = require('window-picker')

				local ok, winsep = pcall(require, 'colorful-winsep')
				if ok then
					winsep.hide()
				end

				local picked_window_id = picker.pick_window({
					filter_rules = {
						bo = {
							-- if the file type is one of following, the window will be ignored
							filetype = {},
						},
					},
					prompt_message = 'Jump to window in current tab',
				})

				if picked_window_id then
					vim.api.nvim_set_current_win(picked_window_id)
				end
			end,
			{ desc = 'Jump to window in current tab' },
		},
	},
}

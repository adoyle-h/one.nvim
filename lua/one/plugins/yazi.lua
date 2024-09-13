return {
	'mikavilpas/yazi.nvim',

	lazy = true,
	cmd = 'Yazi',

	config = function(config)
		require('yazi').setup(config.yazi)
	end,

	defaultConfig = {
		'yazi',
		-- see :h calendar
		{
			-- Below is the default configuration. It is optional to set these values.
			-- You can customize the configuration for each yazi call by passing it to
			-- yazi() explicitly

			-- enable this if you want to open yazi instead of netrw.
			-- Note that if you enable this, you need to call yazi.setup() to
			-- initialize the plugin. lazy.nvim does this for you in certain cases.
			--
			-- If you are also using neotree, you may prefer not to bring it up when
			-- opening a directory:
			-- {
			--   "nvim-neo-tree/neo-tree.nvim",
			--   opts = {
			--     filesystem = {
			--       hijack_netrw_behavior = "disabled",
			--     },
			--   },
			-- }
			open_for_directories = false,

			-- open visible splits as yazi tabs for easy navigation.
			open_multiple_tabs = false,

			highlight_groups = {
				-- See https://github.com/mikavilpas/yazi.nvim/pull/180
				hovered_buffer = nil,
				-- See https://github.com/mikavilpas/yazi.nvim/pull/351
				hovered_buffer_in_same_directory = nil,
			},

			-- the floating window scaling factor. 1 means 100%, 0.9 means 90%, etc.
			floating_window_scaling_factor = 0.9,

			-- the transparency of the yazi floating window (0-100). See :h winblend
			yazi_floating_window_winblend = 0,

			-- the log level to use. Off by default, but can be used to diagnose
			-- issues. You can find the location of the log file by running
			-- `:checkhealth yazi` in Neovim. Also check out the "reproducing issues"
			-- section below
			log_level = vim.log.levels.OFF,

			-- what Neovim should do a when a file was opened (selected) in yazi.
			-- Defaults to simply opening the file.
			-- open_file_function = function(chosen_file, config, state) end,

			-- customize the keymaps that are active when yazi is open and focused. The
			-- defaults are listed below. Note that the keymaps simply hijack input and
			-- they are never sent to yazi, so only try to map keys that are never
			-- needed by yazi.
			--
			-- Also:
			-- - use e.g. `open_file_in_tab = false` to disable a keymap
			-- - you can customize only some of the keymaps (not all of them)
			-- keymaps = {
			-- 	show_help = '<f1>',
			-- 	open_file_in_vertical_split = '<c-v>',
			-- 	open_file_in_horizontal_split = '<c-x>',
			-- 	open_file_in_tab = '<c-t>',
			-- 	grep_in_directory = '<c-s>',
			-- 	replace_in_directory = '<c-g>',
			-- 	cycle_open_buffers = '<tab>',
			-- 	copy_relative_path_to_selected_files = '<c-y>',
			-- 	send_to_quickfix_list = '<c-q>',
			-- },

			-- completely override the keymappings for yazi. This function will be
			-- called in the context of the yazi terminal buffer.
			-- set_keymappings_function = function(yazi_buffer_id, config, context) end,

			-- the type of border to use for the floating window. Can be many values,
			-- including 'none', 'rounded', 'single', 'double', 'shadow', etc. For
			-- more information, see :h nvim_open_win
			yazi_floating_window_border = 'rounded',

			-- some yazi.nvim commands copy text to the clipboard. This is the register
			-- yazi.nvim should use for copying. Defaults to "*", the system clipboard
			clipboard_register = '*',

			-- hooks = {
			-- 	-- if you want to execute a custom action when yazi has been opened,
			-- 	-- you can define it here.
			-- 	yazi_opened = function(preselected_path, yazi_buffer_id, config)
			-- 		-- you can optionally modify the config for this specific yazi
			-- 		-- invocation if you want to customize the behaviour
			-- 	end,

			-- 	-- when yazi was successfully closed
			-- 	yazi_closed_successfully = function(chosen_file, config, state) end,

			-- 	-- when yazi opened multiple files. The default is to send them to the
			-- 	-- quickfix list, but if you want to change that, you can define it here
			-- 	yazi_opened_multiple_files = function(chosen_files, config, state) end,
			-- },

			-- highlight buffers in the same directory as the hovered buffer
			highlight_hovered_buffers_in_same_directory = true,

			-- integrations = {
			-- 	--- What should be done when the user wants to grep in a directory
			-- 	grep_in_directory = function(directory)
			-- 		-- the default implementation uses telescope if available, otherwise nothing
			-- 	end,
			-- 	grep_in_selected_files = function(selected_files)
			-- 		-- similar to grep_in_directory, but for selected files
			-- 	end,
			-- 	--- Similarly, search and replace in the files in the directory
			-- 	replace_in_directory = function(directory)
			-- 		-- default: grug-far.nvim
			-- 	end,
			-- 	replace_in_selected_files = function(selected_files)
			-- 		-- default: grug-far.nvim
			-- 	end,
			-- 	-- `grealpath` on OSX, (GNU) `realpath` otherwise
			-- 	resolve_relative_path_application = '',
			-- },
		},
	},

	keymaps = {
		{
			'n',
			'<space>,',
			'<cmd>Yazi<cr>',
			{ desc = 'Open the yazi window at the current file' },
		},

		{
			'n',
			'<space>.',
			'<cmd>Yazi cwd<cr>',
			{ desc = 'Open the yazi window in current working directory' },
		},
	},
}

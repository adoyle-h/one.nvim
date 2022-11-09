return {
	'vigoux/notifier.nvim',
	disable = true,

	commands = {
		Notifier = {
			function(opts)
				local args = opts.fargs
				vim.notify(args[1], vim.log.levels[string.upper(args[2] or 'info')])
			end,
			{
				nargs = '+',
				desc = 'Send message to notification window. Usage: :Notifier <message> [info|warn|error]',
			},
		},
	},

	highlights = function(config)
		local colors = config.colors
		local bg = colors.darkBlue
		local titleFG = colors.blue
		local contentFG = colors.white

		return {
			-- the title of the notification (lsp:.. and nvim)
			NotifierTitle = { fg = titleFG, bg = bg },
			-- Icon of the notification (if any)
			NotifierIcon = { fg = titleFG, bg = bg },
			-- the content of the notification
			NotifierContent = { fg = contentFG, bg = bg },
			-- dimmed content of the notification
			NotifierContentDim = { fg = contentFG, bg = bg },
		}
	end,

	config = function(config)
		require('notifier').setup(config.notifier)
	end,

	defaultConfig = {
		'notifier',
		{
			ignore_messages = {}, -- Ignore message from LSP servers with this name

			-- status_width = 'textwidth', -- COmputed using 'columns' and 'textwidth'

			components = { -- Order of the components to draw from top to bottom (first nvim notifications, then lsp)
				'nvim', -- Nvim notifications (vim.notify and such)
				'lsp', -- LSP status updates
			},

			notify = {
				clear_time = 5000, -- Time in milliseconds before removing a vim.notify notification, 0 to make them sticky
				min_level = vim.log.levels.INFO, -- Minimum log level to print the notification
			},

			component_name_recall = false, -- Whether to prefix the title of the notification by the component name

			zindex = 50, -- The zindex to use for the floating window. Note that changing this value may cause visual bugs with other windows overlapping the notifier window.
		},
	},
}

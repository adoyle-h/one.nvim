return {
	'rcarriga/nvim-notify',

	keymaps = { { 'n', '<space>N', ':Telescope notify<CR>', { silent = true } } },

	config = function(config)
		local notify = require('notify')
		notify.setup(config.notify)
		vim.notify = notify
	end,

	defaultConfig = function(config)
		local symbolMap = config.symbolMap

		return {
			'notify',
			{
				background_colour = config.colors.black,
				fps = 30,
				icons = {
					ERROR = symbolMap.ERROR,
					WARN = symbolMap.WARN,
					INFO = symbolMap.INFO,
					DEBUG = symbolMap.DEBUG,
					TRACE = symbolMap.TRACE,
				},
				level = 2, -- Minimum log level to display. See :h vim.log.levels
				max_width = 100, -- Max number of columns for popup messages
				minimum_width = 40, -- Minimum number of columns for popup message
				render = 'default',
				stages = 'fade_in_slide_out',
				timeout = 2000, -- Default timeout for notification
				top_down = true,
			},
		}
	end,

	commands = {
		Notify = {
			function(opts)
				local args = opts.fargs
				vim.notify(args[1], args[2] or 'info')
			end,
			{
				nargs = '+',
				desc = 'Send message to notification window. Usage: :Notify <message> [info|warn|error]',
			},
		},

		ClearNotify = {
			function()
				vim.notify.dismiss({ pending = true })
			end,
			{ desc = 'Dismiss all notification windows currently displayed' },
		},
	},

}

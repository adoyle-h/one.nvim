local util = require('one.util')

return {
	'mattn/calendar-vim',
	id = 'calendar',

	config = function(config)
		for key, value in pairs(config.calendar) do vim.g['calendar_' .. key] = value end
	end,

	defaultConfig = {
		'calendar',
		-- see :h calendar
		{
			no_mappings = 1,
			diary = util.dataPath('calendar'),
			navi = 'top',
			mark = 'right',
			monday = 1,
			number_of_months = 4,
			keys = { --
				goto_prev_month = '<',
				goto_next_month = '>',
				goto_prev_year = '{',
				goto_next_year = '}',
			},
		},
	},

	filetypes = {
		calendar = function()
			local nsName = 'Plug:Calendar'
			local nsMap = vim.api.nvim_get_namespaces()
			local ns = nsMap[nsName]
			if not ns then
				ns = vim.api.nvim_create_namespace(nsName)
				vim.api.nvim_set_hl(ns, 'Normal', { bg = '#18171B' })
			end
			vim.api.nvim_win_set_hl_ns(0, ns)
		end,
	},
}

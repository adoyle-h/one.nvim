local M = {
	'petertriho/nvim-scrollbar',
	config = function(config)
		require('scrollbar').setup(config.scrollbar)

		if pcall(require, 'hlslens') then require('scrollbar.handlers.search').setup(config.hlslens) end
	end,
}

M.defaultConfig = function(config)
	local c = config.colors
	local has_hlslens = pcall(require, 'hlslens')

	return {
		'scrollbar',
		{
			show = true,
			show_in_active_only = false,
			set_highlights = true,
			folds = 1000, -- handle folds, set to number to disable folds if no. of lines in buffer exceeds this
			max_lines = false, -- disables if no. of lines in buffer exceeds this

			handle = {
				text = ' ',
				priority = 100,
				color = c.scrollbarBG,
				cterm = nil,
				highlight = 'ScrollbarHandle',
				hide_if_all_visible = true, -- Hides handle if all lines are visible
			},

			marks = {
				Search = {
					text = { '-', '=' },
					priority = 100,
					color = c.match.fg,
					cterm = nil,
					highlight = 'ScrollbarSearchMark',
				},

				Error = {
					text = { '-', '=' },
					priority = 101,
					color = c.red,
					cterm = nil,
					highlight = 'ScrollbarErrorMark',
				},

				Warn = {
					text = { '-', '=' },
					priority = 102,
					color = c.yellow,
					cterm = nil,
					highlight = 'ScrollbarWarnMark',
				},

				Info = {
					text = { '-', '=' },
					priority = 103,
					color = c.blue,
					cterm = nil,
					highlight = 'ScrollbarInfoMark',
				},

				Hint = {
					text = { '-', '=' },
					priority = 104,
					color = c.cyan,
					cterm = nil,
					highlight = 'ScrollbarHintMark',
				},

				Misc = {
					text = { '-', '=' },
					priority = 105,
					color = c.white,
					cterm = nil,
					highlight = 'ScrollbarMiscMark',
				},
			},

			excluded_buftypes = {},

			excluded_filetypes = {
				'noice', -- noice has its builtin scrollbar
			},

			autocmd = {
				render = {
					'BufWinEnter',
					'TabEnter',
					'TermEnter',
					'WinEnter',
					'CmdwinLeave',
					'TextChanged',
					'VimResized',
					'WinScrolled',
				},

				clear = { 'BufWinLeave', 'TabLeave', 'TermLeave', 'WinLeave' },
			},

			handlers = {
				diagnostic = true,
				search = has_hlslens, -- will auto run require('scrollbar.handlers.search').setup()
			},
		},

	}
end

return M

return {
	'nvim-treesitter/nvim-treesitter-context',
	desc = 'Shows the context of the currently visible buffer contents.',

	highlights = function(config)
		local c = config.colors
		return {
			TreesitterContext = { bg = c.darkCyan, italic = true, bold = true },
			TreesitterContextLineNumber = { bg = c.darkCyan, italic = true, bold = true },
		}
	end,

	config = function(config)
		require('treesitter-context').setup(config.treesitterContext)
	end,

	-- doc: https://github.com/nvim-treesitter/nvim-treesitter-context
	defaultConfig = {
		'treesitterContext',
		{
			enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
			max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
			min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
			line_numbers = true,
			multiline_threshold = 20, -- Maximum number of lines to show for a single context
			trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
			mode = 'cursor', -- Line used to calculate context. Choices: 'cursor', 'topline'
			-- Separator between context and content. Should be a single character string, like '-'.
			-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
			separator = nil,
			zindex = 20, -- The Z-index of the context window
			on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
		},
	},
}

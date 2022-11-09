return {
	'nvim-treesitter/nvim-treesitter-context',
	desc = 'Shows the context of the currently visible buffer contents.',
	disable = true, -- BUG: https://github.com/nvim-treesitter/nvim-treesitter-context/issues/163

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
			mode = 'cursor', -- Line used to calculate context. Choices: 'cursor', 'topline'
			max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
		},
	},
}

local config = require('one.config').config
local colors = config.colors

local M = {
	'lukas-reineke/indent-blankline.nvim',
	desc = 'Show indent line',
	after = 'nvim-treesitter',

	highlights = { --
		IblIndent = { fg = colors.grey1 },
		IblWhitespace = { fg = colors.grey1 },
		IblScope = { fg = colors.purple },
	},
}

M.defaultConfig = {
	'indent-blankline',
	{ -- :h ibl.config
		enabled = true,
		debounce = 200,
		viewport_buffer = { min = 30, max = 500 },
		indent = {
			char = '▏', -- '▎', '┊', '', '⎜', '⎸', '│', '⎜', '⎜', '⎜'
			tab_char = nil,
			highlight = 'IblIndent',
			smart_indent_cap = true,
			priority = 1,
		},
		whitespace = { highlight = 'IblWhitespace', remove_blankline_trail = false },
		scope = {
			enabled = true,
			char = '▏',
			show_start = false, -- Shows an underline on the first line of the scope
			show_end = false, -- Shows an underline on the last line of the scope
			injected_languages = true,
			highlight = 'IblScope',
			priority = 1024,
			include = { node_type = {} },
			exclude = {
				language = {},
				node_type = { ['*'] = { 'source_file', 'program' }, lua = { 'chunk' }, python = { 'module' } },
			},
		},
		exclude = {
			filetypes = {
				'lspinfo',
				'packer',
				'checkhealth',
				'help',
				'man',
				'gitcommit',
				'TelescopePrompt',
				'TelescopeResults',
				'alpha',
			},
			buftypes = { 'terminal', 'nofile', 'quickfix', 'prompt' },
		},
	},
}

function M.config(config)
	require('ibl').setup(config['indent-blankline'])
end

return M

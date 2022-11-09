return {
	'nvim-telescope/telescope-ui-select.nvim',
	desc = 'improve the default vim.ui interfaces, like lsp.buf.code_action',
	config = function()
		local telescope = require('telescope')
		telescope.setup {
			extensions = { ['ui-select'] = { layout_config = { width = 0.4, height = 16 } } },
		}
		telescope.load_extension('ui-select')
	end,
}

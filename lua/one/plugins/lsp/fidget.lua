return {
	'j-hui/fidget.nvim',
	desc = 'nvim-lsp loading progress',
	disable = true, -- use noice lsp.progress

	highlights = function(config)
		local c = config.colors
		return { FidgetTask = { fg = c.grey } }
	end,

	config = function(config)
		require('fidget').setup(config['lsp-fidget'])
	end,

	defaultConfig = { { 'lsp-fidget' }, {} },
}

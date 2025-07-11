return {
	'lsp',

	requires = {
		require('one.plugins.lsp.mason'),
		require('one.plugins.lsp.mason-installer'),
		'mason-org/mason-lspconfig.nvim',
		require('one.plugins.lsp.main'),
	},

	deps = {
		require('one.plugins.lsp.none-ls'),
		require('one.plugins.lsp.preview'),
		require('one.plugins.lsp.nlsp'),
		require('one.plugins.lsp.fidget'),

		{
			'adoyle-h/lsp-toggle.nvim',
			config = function(config)
				require('lsp-toggle').setup(config.lsp.toggle)
			end,
			defaultConfig = { { 'lsp', 'toggle' }, {} },
		},
	},
}

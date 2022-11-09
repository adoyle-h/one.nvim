return {
	'windwp/nvim-ts-autotag',

	after = 'nvim-treesitter', -- for PackerSync

	config = function(config)
		require('nvim-ts-autotag').setup(config.autotag)
	end,

	defaultConfig = {
		'autotag',
		{
			filetypes = {
				-- LuaFormatter off
				'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte',
				'vue', 'tsx', 'jsx', 'rescript', 'xml', 'php', 'markdown', 'glimmer', 'handlebars', 'hbs',
				-- LuaFormatter on
			},

			skip_tags = {
				-- LuaFormatter off
				'area', 'base', 'br', 'col', 'command', 'embed', 'hr', 'img', 'slot', 'input', 'keygen',
				'link', 'meta', 'param', 'source', 'track', 'wbr', 'menuitem',
				-- LuaFormatter on
			},
		},
	},
}

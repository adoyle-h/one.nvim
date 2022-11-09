return {
	'cmp-snippet',

	requires = { --
		'dcampos/nvim-snippy',
		'dcampos/cmp-snippy',
	},

	deps = { --
		'justinj/vim-react-snippets',
		'rafamadriz/friendly-snippets',
		'honza/vim-snippets',
	},

	config = function(config)
		require('snippy').setup(config.snippy)
	end,

	defaultConfig = {
		'snippy',
		{
			-- :h snippy
			scopes = {
				-- Because nvim-snippy will merge all snippets into a map which like {'snippet_title' = 'snippet_body'}
				-- Higher priority will override the lower. See ":h snippy-usage-priority"
				-- https://github.com/dcampos/nvim-snippy/blob/1860215584d4835d87f75896f07007b3b3c06df4/lua/snippy/util.lua#L44-L58
				sh = { '_', 'sh' }, -- Load _.snippets and sh.snippets for "sh" filetype
			},
		},
	},

}

return {
	'majutsushi/tagbar',
	desc = 'Outline - tagbar',

	keymaps = { { 'n', '<leader>tb', ':TagbarToggle fj<CR>' } },

	config = function(config)
		for key, val in pairs(config.tagbar) do vim.g['tagbar_' .. key] = val end
	end,

	defaultConfig = {
		'tagbar',
		{
			autofocus = 1,
			case_insensitive = 1,
			sort = 1,
			type_go = {
				ctagstype = 'go',
				kinds = {
					'p:package',
					'i:imports:1',
					'c:constants',
					'v:variables',
					't:types',
					'n:interfaces',
					'w:fields',
					'e:embedded',
					'm:methods',
					'r:constructor',
					'f:functions',
				},
				sro = '.',
				kind2scope = { t = 'ctype', n = 'ntype' },
				scope2kind = { ctype = 't', ntype = 'n' },
				ctagsbin = 'gotags',
				ctagsargs = '-sort -silent',
			},
		},
	},
}

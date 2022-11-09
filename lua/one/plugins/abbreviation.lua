local util = require('one.util')

return {
	'tpope/vim-abolish',

	desc = [[
		Easily search for, substitute, and abbreviate multiple variants of a word.

    vim-abolish set the default keymaps. ":h cr" for more descriptions.
    https://github.com/tpope/vim-abolish#coercion
			MixedCase (crm)
			camelCase (crc)
			snake_case (crs or cr_)
			SNAKE_UPPERCASE (cru)
			dash-case (cr-)
			kebab-case (crk)
			dot.case (cr.)
			space case (cr<space>)
	]],

	config = function(config)
		vim.g.abolish_save_file = config.abbreviation.saveFile
	end,

	defaultConfig = { 'abbreviation', { saveFile = util.dataPath('abbreviations.vim') } },

}

return {
	'format',
	desc = 'Format Settings',

	deps = {
		require('one.plugins.align'),

		{ 'editorconfig/editorconfig-vim', desc = '.editorconfig support' },

		{
			'rhlobo/vim-super-retab',
			on = { 'Space2Tab', 'Tab2Space' },
			desc = 'Convert spaces to tabs, or tabs to spaces',
		},

		{ 'tpope/vim-sleuth', desc = 'Auto set shiftwidth expandtab based on text context' },
	},
}

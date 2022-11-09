return {
	'markdown',

	desc = 'Markdown Plugins',
	highlights = require('one.plugins.markdown.highlights'),

	deps = {
		{ 'sotte/presenting.vim', ft = 'markdown', desc = 'presentable slides in vim' },
		require('one.plugins.markdown.main'),
		require('one.plugins.markdown.toc'),
		require('one.plugins.markdown.preview'),
		require('one.plugins.markdown.headlines'),
	},
}

return {
	'scrooloose/nerdcommenter',
	desc = 'comment codes',

	defaultConfig = {
		'comment',
		{
			spaceDelims = 1,
			removeExtraSpaces = 1,
			commentWholeLinesInVMode = 1,
			delimiters = {
				['javascript.jsx'] = { left = '//', right = '', leftAlt = '{/*', rightAlt = '*/}' },
				plantuml = { left = '\'', right = '' },
			},
		},
	},

	config = function(config)
		local conf = config.comment

		vim.g.NERDSpaceDelims = conf.spaceDelims
		vim.g.NERDRemoveExtraSpaces = conf.removeExtraSpaces
		vim.g.NERDCommentWholeLinesInVMode = conf.commentWholeLinesInVMode
		vim.g.NERDCustomDelimiters = conf.delimiters
	end,
}

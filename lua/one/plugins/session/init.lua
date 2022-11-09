return {
	'session',

	deps = {
		require('one.plugins.session.persisted'),

		{
			'chrisbra/Recover.vim',
			desc = 'Show difference between the hidden swap file and the regular saved file. Very useful.',
		},
	},
}

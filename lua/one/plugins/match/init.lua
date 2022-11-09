return {
	'match',
	desc = 'Match quotes, parenthesis, brackets, pairs etc.',

	deps = {
		require('one.plugins.match.surround'),
		require('one.plugins.match.autopairs'),
		require('one.plugins.match.ts-autotag'),
		require('one.plugins.match.matchup'),
		require('one.plugins.match.pears'),
	},
}

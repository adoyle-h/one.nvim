local M = {
	'git',
	desc = 'Git Plugins',

	deps = {
		require('one.plugins.git.sign'),
		require 'one.plugins.git.lazygit',
		{ 'sindrets/diffview.nvim', desc = 'Git Diff' },

		{ 'tpope/vim-fugitive', desc = 'git commands in vim' },
		require 'one.plugins.git.blame',
		require 'one.plugins.git.gutter',
	},
}

return M

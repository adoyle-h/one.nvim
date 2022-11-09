local config = require('one.config').config

return {
	'dyng/ctrlsf.vim',
	desc = 'Search all contents in workspace',
	on = { '<Plug>CtrlSFPrompt', '<Plug>CtrlSFVwordPath', 'CtrlSF' },

	keymaps = {
		{ 'n', '<leader>f', '<Plug>CtrlSFPrompt' },
		{ 'v', '<leader>f', '<Plug>CtrlSFVwordPath' },
	},

	defaultConfig = {
		{ 'search', 'ctrlsf' },
		{
			ignoreDir = config.ignore.fileSearch.directories,
			context = '-C 3',
			autoClose = 0,
			followSymlinks = 0,
		},
	},

	config = function()
		local conf = config.search.ctrlsf
		vim.g.ctrlsf_auto_close = conf.autoClose
		vim.g.ctrlsf_ignore_dir = conf.ignoreDir
		vim.g.ctrlsf_context = conf.content
		vim.g.ctrlsf_follow_symlinks = conf.followSymlinks
	end,
}

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
			ignore_dir = config.ignore.fileSearch.directories,
			context = '-C 3',
			auto_close = 0,
			follow_symlinks = 0,
		},
	},

	config = function()
		local conf = config.search.ctrlsf
		local g = vim.g
		for key, value in pairs(config.search.ctrlsf) do g['ctrlsf_' .. key] = value end

		-- TODO: For backward compatibility. To remove them later.
		if conf.ignoreDir then g.ctrlsf_ignore_dir = conf.ignoreDir end
		if conf.autoClose then vim.g.ctrlsf_auto_close = conf.autoClose end
		if conf.followSymlinks then vim.g.ctrlsf_follow_symlinks = conf.followSymlinks end
	end,
}

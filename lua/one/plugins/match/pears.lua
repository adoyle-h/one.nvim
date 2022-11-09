return {
	'steelsojka/pears.nvim',
	desc = 'Auto complete pairs. Auto remove empty pairs. Support tags.',
	disable = true, -- BUG: <C-r>" in insert mode with pairs content will make all texts messy
	config = function()
		require('pears').setup(function(conf)
			conf.preset 'tag_matching'
		end)
	end,
	defaultConfig = { 'pears', {} },
}

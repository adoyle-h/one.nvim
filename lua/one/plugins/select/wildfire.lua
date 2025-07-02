return {
	'gcmt/wildfire.vim',
	desc = 'Select the text-objects',

	keymaps = {
		{ '', '<M-v>', '<Plug>(wildfire-fuel)', desc = 'Smart select the next closest text object.' },
		{ '', '<M-V>', '<Plug>(wildfire-water)', desc = 'Smart select the previous closest text object.' },
	},

	config = function(config)
		vim.g.wildfire_objects = config.select.wildfire.textobjects
	end,

	defaultConfig = {
		{ 'select', 'wildfire' },
		{
			textobjects = {
				['*'] = { 'i\'', 'a\'', 'i"', 'a"', 'i)', 'a)', 'i]', 'a]', 'i}', 'a}', 'ip' },
				['html,xml'] = { 'at' }, -- html and xml share the same text objects
			},
		},
	},
}

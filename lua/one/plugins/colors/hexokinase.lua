return {
	'RRethy/vim-hexokinase',

	run = 'make hexokinase',

	config = function(config)
		for key, value in pairs(config.hexokinase) do vim.g['Hexokinase_' .. key] = value end
	end,

	defaultConfig = {
		'hexokinase',
		{
			-- 'virtual', 'sign_column', 'background', 'backgroundfull', 'foreground', 'foregroundfull'
			highlighters = { 'backgroundfull' },
			optInPatterns = { 'full_hex', 'triple_hex', 'rgb', 'rgba', 'hsl', 'hsla', 'colour_names' },
			-- ftEnabled = {'css', 'html', 'javascript'}
		},
	},
}

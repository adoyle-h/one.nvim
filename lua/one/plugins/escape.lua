local function escape()
	if vim.fn.index({ 'TelescopePrompt', 'neo-tree', 'neo-tree-popup', 'yazi' }, vim.bo.filetype) then
		-- <c-v> is used to avoid mappings
		return '<C-v>j<C-v>k'
	end
	return '<ESC>'
end

return {
	'max397574/better-escape.nvim',

	defaultConfig = {
		'escape',
		{
			timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default

			default_mappings = false,

			mappings = {
				i = {
					j = {
						k = escape,
					},
				},

				t = {
					j = {
						k = escape,
					},
				},
			},
		},
	},

	config = function(config)
		require('better_escape').setup(config.escape)
	end,
}

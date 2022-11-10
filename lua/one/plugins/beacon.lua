return {
	'rainbowhxch/beacon.nvim',

	highlights = function(config)
		local c = config.colors
		return { Beacon = { bg = c.blue } }
	end,

	config = function(config)
		require('beacon').setup(config.beacon)
	end,

	defaultConfig = {
		'beacon',
		{
			enable = true,
			size = 60,
			fade = true,
			minimal_jump = 10,
			show_jumps = true,
			focus_gained = false,
			shrink = true,
			timeout = 1200,
			ignore_buffers = {},
			ignore_filetypes = {
				-- LuaFormatter off
				'TelescopePrompt', 'TelescopeResults', 'lsp-installer', 'null-ls-info', 'lspinfo', 'aerial',
				'nerdtree', 'NvimTree', 'neo-tree', 'notify', 'Trouble', 'Mundo', 'mason', 'man', 'calendar',
				'PlenaryTestPopup', 'noice',
				-- LuaFormatter on
			},
		},
	},
}

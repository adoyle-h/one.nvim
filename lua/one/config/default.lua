-- User should not change this file. Edit require('one').setup({config}) in your init.lua.
return function(colors)
	local symbol = require('one.config.symbol')
	local util = require('one.util')

	-- @type Config {table}
	return {
		leaderKey = ';', -- Set a map <leader> for more key combos

		colors = colors, -- basic colors

		symbolMap = symbol.symbolMap,

		kindSymbolMap = symbol.kindSymbolMap,

		theme = {
			use = 'one', -- See the filaname in ../plugins/themes/
		},

		-- Global lua variable. So you can easily call the framework, like ":lua one.util"
		-- If set nil or false, do not create this variable.
		global = 'one',

		pluginManager = {
			use = 'lazy',

			lazy = require('one.config.lazy'),

			['local'] = {
				pluginDir = util.dataPath('plugins'), -- Plugin install directory.
			},
		},

		proxy = {
			-- If you are in China Mainland, it is suggested to set 'https://gh-proxy.com/'
			github = nil, -- string|nil  proxy url
		},

		ignore = {
			fileSearch = { --
				directories = { 'node_modules', '.git' },
				files = {},
			},

			fileTypesForSomePlugs = {
				-- LuaFormatter off
				'TelescopePrompt', 'TelescopeResults', 'lsp-installer', 'null-ls-info', 'lspinfo', 'aerial',
				'nerdtree', 'NvimTree', 'neo-tree', 'notify', 'Trouble', 'Mundo', 'mason', 'man', 'alpha', 'calendar',
				'PlenaryTestPopup', 'noice', 'lazy', 'gitcommit',
				-- LuaFormatter on
			},
		},

		-- More options defined in "defaultConfig" of each plugin
	}
end

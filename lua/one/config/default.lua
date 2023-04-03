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

		impatient = { -- Speed up require lua modules to improve startup time.
			enable = true,
			src = 'https://github.com/lewis6991/impatient.nvim',
			dist = util.dataPath('site/pack/user/start/impatient.nvim'),
			pkgName = 'impatient',
			chunks = { enable = true, path = util.cachePath('luacache_chunks') },
			modpaths = { enable = true, path = util.cachePath('luacache_modpaths') },
		},

		-- Global lua variable. So you can easily call the framework, like ":lua one.util"
		-- If set nil or false, do not create this variable.
		global = 'one',

		pluginManager = {
			use = 'lazy', -- 'vim-plug' or 'packer' or 'lazy'

			['vim-plug'] = require('one.config.vim-plug'),

			packer = require('one.config.packer'),

			lazy = require('one.config.lazy'),
		},

		proxy = {
			-- If you are in China Mainland, it is suggested to set 'https://ghproxy.com/'
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
				'PlenaryTestPopup', 'noice', 'lazy',
				-- LuaFormatter on
			},
		},

		-- More options defined in "defaultConfig" of each plugin
	}
end

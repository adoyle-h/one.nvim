return {
	'WhoIsSethDaniel/mason-tool-installer.nvim',

	defaultConfig = {
		'mason-installer',
		{
			-- a list of all tools you want to ensure are installed upon start;
			-- Package Index: https://github.com/williamboman/mason.nvim/blob/main/PACKAGES.md
			ensure_installed = {
				'lua-language-server', -- package name
				'luaformatter', -- Create .lua-format file in project, https://github.com/Koihik/LuaFormatter#style-configure-file
				-- { 'golangci-lint', version = '1.47.0' }, -- you can pin a tool to a particular version
				-- { 'bash-language-server', auto_update = true }, -- you can turn off/on auto_update per tool
			},

			-- if set to true this will check each tool for updates. If updates
			-- are available the tool will be updated. This setting does not
			-- affect :MasonToolsUpdate or :MasonToolsInstall.
			auto_update = false,

			-- automatically install / update on startup. If set to false nothing
			-- will happen on startup. You can use :MasonToolsInstall or
			-- :MasonToolsUpdate to install tools and check for updates.
			run_on_start = true,

			-- set a delay (in ms) before the installation starts. This is only
			-- effective if run_on_start is set to true.
			-- e.g.: 5000 = 5 second delay, 10000 = 10 second delay, etc...
			start_delay = 2000, -- 2 second delay
		},
	},

	config = function(config)
		require('mason-tool-installer').setup(config['mason-installer'])
	end,

	autocmds = {
		User = {
			pattern = 'MasonToolsUpdateCompleted',
			callback = function()
				vim.schedule(function()
					print 'mason-tool-installer has finished'
				end)
			end,
		},
	},
}

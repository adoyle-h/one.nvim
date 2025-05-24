local M = {
	'ravitemer/mcphub.nvim',
	build = 'npm install -g mcp-hub@latest', -- Installs `mcp-hub` node binary globally
	config = function(config)
		require('mcphub').setup(config.mcphub)
	end,
}

M.keymaps = {
	{ 'n', '<leader>m', ':MCPHub<CR>' },
}

M.defaultConfig = { 'mcphub', {
	--- `mcp-hub` binary related options-------------------
	config = vim.fn.expand('~/.config/mcphub/servers.json'), -- Absolute path to MCP Servers config file (will create if not exists)
	port = 37373, -- The port `mcp-hub` server listens to
	shutdown_delay = 60 * 10 * 000, -- Delay in ms before shutting down the server when last instance closes (default: 10 minutes)
	use_bundled_binary = false, -- Use local `mcp-hub` binary (set this to true when using build = "bundled_build.lua")

	---Chat-plugin related options-----------------
	auto_approve = false, -- Auto approve mcp tool calls
	auto_toggle_mcp_servers = true, -- Let LLMs start and stop MCP servers automatically
	extensions = {
		avante = {
			make_slash_commands = true, -- make /slash commands from MCP server prompts
		},
	},

	--- Plugin specific options-------------------
	native_servers = {}, -- add your custom lua native servers here
	ui = {
		window = {
			width = 0.8, -- 0-1 (ratio); "50%" (percentage); 50 (raw number)
			height = 0.8, -- 0-1 (ratio); "50%" (percentage); 50 (raw number)
			relative = 'editor',
			zindex = 50,
			border = 'rounded', -- "none", "single", "double", "rounded", "solid", "shadow"
		},
		wo = { -- window-scoped options (vim.wo)
			winhl = 'Normal:MCPHubNormal,FloatBorder:MCPHubBorder',
		},
	},
	on_ready = function(hub)
		-- Called when hub is ready
	end,
	on_error = function(err)
		-- Called on errors
	end,
	log = {
		level = vim.log.levels.WARN,
		to_file = false,
		file_path = nil,
		prefix = 'MCPHub',
	},
} }

return M

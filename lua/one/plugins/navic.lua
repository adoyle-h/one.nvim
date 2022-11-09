-- For current, we use aerial lualine component instead of nvim-navic
local M = {
	'SmiteshP/nvim-navic',
	desc = 'A winbar component that uses LSP to show your current code context.',
}

M.defaultConfig = function(config)
	local icons = {}
	for k, v in pairs(config.kindSymbolMap) do icons[k] = v .. ' ' end

	return {
		'navic',
		{
			icons = icons,

			highlight = false,
			separator = ' > ',
			depth_limit = 0,
			depth_limit_indicator = '..',
		},
	}
end

function M.config(config)
	-- silence warning/error messages thrown by nvim-navic
	vim.g.navic_silence = true
	require('nvim-navic').setup(config.navic)
end

M.autocmds = {
	LspAttach = {
		callback = function(args)
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			require('nvim-navic').attach(client, args.buf)
		end,
	},
}

return M

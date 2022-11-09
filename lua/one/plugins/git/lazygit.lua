return {
	'kdheepak/lazygit.nvim',

	desc = 'Install lazygit. https://github.com/jesseduffield/lazygit',

	config = function(config)
		for key, value in pairs(config.lazygit) do vim.g[key] = value end
	end,

	defaultConfig = {
		'lazygit',
		{
			lazygit_floating_window_winblend = 0, -- transparency of floating window
			lazygit_floating_window_scaling_factor = 0.9, -- scaling factor for floating window
			lazygit_floating_window_corner_chars = { '╭', '╮', '╰', '╯' }, -- customize lazygit popup window corner characters
			lazygit_floating_window_use_plenary = 1, -- use plenary.nvim to manage floating window if available
			lazygit_use_neovim_remote = 0, -- fallback to 0 if neovim-remote is not installed
		},
	},

	keymaps = { { 'n', '<leader>gg', ':LazyGit<CR>' } },
}

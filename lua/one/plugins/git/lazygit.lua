return {
	'kdheepak/lazygit.nvim',

	desc = 'Install lazygit. https://github.com/jesseduffield/lazygit',

	config = function(config)
		for key, value in pairs(config.lazygit) do vim.g['lazygit_' .. key] = value end
		require('telescope').load_extension('lazygit')
	end,

	defaultConfig = {
		'lazygit',
		{
			floating_window_winblend = 0, -- transparency of floating window
			floating_window_scaling_factor = 0.8, -- scaling factor for floating window
			floating_window_border_chars = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' }, -- customize lazygit popup window border characters
			floating_window_use_plenary = 1, -- use plenary.nvim to manage floating window if available
			use_neovim_remote = 1, -- fallback to 0 if neovim-remote is not installed
			use_custom_config_file_path = 0, -- config file path is evaluated if this value is 1
			config_file_path = '', -- custom config file path
		},
	},

	keymaps = { { 'n', '<leader>gg', ':LazyGit<CR>' } },
}

return {
	id = 'telescope.menu',

	defaultConfig = {
		{ 'telescope', 'menu' },
		{
			{ 'Telescope pickers', ':call feedkeys("<space>;")' },

			{
				'File',
				{ 'Entire selection (C-a)', ':call feedkeys("GVgg")' },
				{ 'Save current file (C-s)', ':w' },
				{ 'Save all files (C-A-s)', ':wa' },
				{ 'Quit (C-q)', ':qa' },
				{ 'File browser (C-i)', ':lua require\'telescope\'.extensions.file_browser.file_browser()', 1 },
				{ 'Search word (A-w)', ':lua require(\'telescope.builtin\').live_grep()', 1 },
				{ 'Git files (A-f)', ':lua require(\'telescope.builtin\').git_files()', 1 },
				{ 'Files (C-f)', ':lua require(\'telescope.builtin\').find_files()', 1 },
			},

			{
				'Help',
				{ 'tips', ':help tips' },
				{ 'cheatsheet', ':help index' },
				{ 'tutorial', ':help tutor' },
				{ 'summary', ':help summary' },
				{ 'quick reference', ':help quickref' },
				{ 'search help(F1)', ':lua require(\'telescope.builtin\').help_tags()', 1 },
			},

			{
				'Vim',
				{ 'reload vimrc', ':source $MYVIMRC' },
				{ 'check health', ':checkhealth' },
				{ 'jumps (Alt-j)', ':lua require(\'telescope.builtin\').jumplist()' },
				{ 'commands', ':lua require(\'telescope.builtin\').commands()' },
				{ 'command history', ':lua require(\'telescope.builtin\').command_history()' },
				{ 'registers (A-e)', ':lua require(\'telescope.builtin\').registers()' },
				{ 'colorshceme', ':lua require(\'telescope.builtin\').colorscheme()', 1 },
				{ 'vim options', ':lua require(\'telescope.builtin\').vim_options()' },
				{ 'keymaps', ':lua require(\'telescope.builtin\').keymaps()' },
				{ 'buffers', ':Telescope buffers' },
				{ 'search history (C-h)', ':lua require(\'telescope.builtin\').search_history()' },
				{ 'paste mode', ':set paste!' },
				{ 'cursor line', ':set cursorline!' },
				{ 'cursor column', ':set cursorcolumn!' },
				{ 'spell checker', ':set spell!' },
				{ 'relative number', ':set relativenumber!' },
				{ 'search highlighting (F12)', ':set hlsearch!' },
			},

		},
	},

	telescopes = function(config)
		return {

			menu = {
				desc = 'list a menu of user commands',
				command = function()
					local parsers = require('nvim-treesitter.parsers').available_parsers()
					local list = {}
					local api = vim.api

					for i, lang in pairs(parsers) do
						local installed = #api.nvim_get_runtime_file('parser/' .. lang .. '.so', false) > 0

						list[i] = {
							text = string.format('%s %s', installed and '' or '', lang),
							entry = { ordinal = lang },
							lang = lang,
							installed,
						}
					end

					return list
				end,
			},

		}
	end,
}

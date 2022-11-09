return {
	'vasconcelloslf/vim-interestingwords',
	desc = 'Highlight any words under cursor',

	config = function()
		local conf = require('one.config').config.highlightWords

		vim.g.interestingWordsGUIColors = conf.gui
		vim.g.interestingWordsTermColors = conf.cterm
		vim.g.interestingWordsRandomiseColors = conf.randomiseColors
	end,

	defaultConfig = {
		{ 'highlightWords' },
		{
			-- LuaFormatter off
			gui = {
				'#8CCBEA', '#A4E57E', '#FFDB72', '#FF7272', '#FFB3FF', '#9999FF', '#C9853E', '#4083F8',
				'#5F9B2F', '#8255FF', '#D25B9F', '#406661', '#95956E', '#284184', '#6C7B95', '#835858',
			},
			cterm = {},
			-- LuaFormatter on

			randomiseColors = 0,
		},
	},

	keymaps = {
		{ 'n', '<leader>k', ':call InterestingWords("n")<CR>', { silent = true } },
		{ 'v', '<leader>k', '<Plug>InterestingWords', { silent = true } },
		{ 'n', '<leader>K', '<Plug>InterestingWordsClear', { silent = true } },
		{ 'n', '[k', '<Plug>InterestingWordsBackward', { silent = true } },
		{ 'n', ']k', '<Plug>InterestingWordsForeward', { silent = true } },
	},
}

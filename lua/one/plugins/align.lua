return {
	'junegunn/vim-easy-align',

	on = { '<Plug>(EasyAlign)', 'EasyAlign' },

	keymaps = {
		{ 'n', '<leader>A', '<Plug>(EasyAlign)' },
		{ 'x', '<leader>A', '<Plug>(EasyAlign)' },
		{ 'n', '<leader>a', '<Plug>(LiveEasyAlign)' },
		{ 'x', '<leader>a', '<Plug>(LiveEasyAlign)' },
	},

	config = function(config)
		local conf = config.align

		vim.g.easy_align_ignore_groups = conf.ignoreGroups
		vim.g.easy_align_delimiters = conf.delimiters
	end,

	defaultConfig = {
		'align',
		{
			delimiters = {
				['>'] = { pattern = '>>|=>|>' },

				['/'] = { pattern = '//+|/*|*/', delimiter_align = 'l', ignore_groups = { '!Comment' } },

				[']'] = { pattern = '[[]]', left_margin = 0, right_margin = 0, stick_to_left = 0 },

				[')'] = { pattern = '[()]', left_margin = 0, right_margin = 0, stick_to_left = 0 },

				['d'] = { pattern = ' (S+s*[;=])@=', left_margin = 0, right_margin = 0 },
			},
		},

		ignoreGroups = { 'Comment', 'String' },
	},
}

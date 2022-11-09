return {
	'matze/vim-move',
	desc = 'Use <M-j> and <M-k> to move char/line/block under cursor',

	setup = function()
		-- Because keymaps <M-h> and <M-l> are defined in tree-climber plugin
		vim.g.move_map_keys = 0
	end,

	keymaps = {
		{ 'n', '<M-j>', '<Plug>MoveLineDown' },
		{ 'n', '<M-k>', '<Plug>MoveLineUp' },
		{ 'v', '<M-j>', '<Plug>MoveBlockDown' },
		{ 'v', '<M-k>', '<Plug>MoveBlockUp' },
	},
}

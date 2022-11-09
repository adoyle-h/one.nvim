return {
	'theHamsta/nvim-treesitter-pairs',
	disable = true,

	config = function(config)
		require'nvim-treesitter.configs'.setup { pairs = config.treesitter.pairs }
	end,

	defaultConfig = {
		{ 'treesitter', 'pairs' },
		{
			enable = true,
			disable = {},
			highlight_pair_events = {}, -- e.g. {"CursorMoved"}, -- when to highlight the pairs, use {} to deactivate highlighting
			highlight_self = false, -- whether to highlight also the part of the pair under cursor (or only the partner)
			goto_right_end = false, -- whether to go to the end of the right partner or the beginning
			fallback_cmd_normal = 'call matchit#Match_wrapper(\'\',1,\'n\')', -- What command to issue when we can't find a pair (e.g. "normal! %")
			keymaps = { goto_partner = '%', delete_balanced = 'X' },
			delete_balanced = {
				only_on_first_char = false, -- whether to trigger balanced delete when on first character of a pair
				fallback_cmd_normal = nil, -- fallback command when no pair found, can be nil
				longest_partner = false, -- whether to delete the longest or the shortest pair when multiple found.
				-- E.g. whether to delete the angle bracket or whole tag in  <pair> </pair>
			},
		},
	},
}

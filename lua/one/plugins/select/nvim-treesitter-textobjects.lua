return {
	'nvim-treesitter/nvim-treesitter-textobjects',

	after = 'nvim-treesitter',

	config = function(config)
		require('nvim-treesitter.configs').setup { textobjects = config.select.textobjects }
	end,

	defaultConfig = {
		{ 'select', 'textobjects' },

		-- @attribute.inner
		-- @attribute.outer
		-- @block.inner
		-- @block.outer
		-- @call.inner
		-- @call.outer
		-- @class.inner
		-- @class.outer
		-- @comment.outer
		-- @conditional.inner
		-- @conditional.outer
		-- @frame.inner
		-- @frame.outer
		-- @function.inner
		-- @function.outer
		-- @loop.inner
		-- @loop.outer
		-- @parameter.inner
		-- @parameter.outer
		-- @scopename.inner
		-- @statement.outer
		{
			select = {
				enable = true,
				-- Automatically jump forward to textobj, similar to targets.vim
				lookahead = true,

				keymaps = {
					-- You can use the capture groups defined in textobjects.scm
					['af'] = '@function.outer',
					['if'] = '@function.inner',
					['ac'] = '@class.outer',
					-- you can optionally set descriptions to the mappings (used in the desc parameter of nvim_buf_set_keymap
					['ic'] = { query = '@class.inner', desc = 'Select inner part of a class region' },
				},

				-- You can choose the select mode (default is charwise 'v')
				selection_modes = {
					['@parameter.outer'] = 'v', -- charwise
					['@function.outer'] = 'V', -- linewise
					['@class.outer'] = '<c-v>', -- blockwise
				},
				-- If you set this to `true` (default is `false`) then any textobject is
				-- extended to include preceding xor succeeding whitespace. Succeeding
				-- whitespace has priority in order to act similarly to eg the built-in `ap`.
				include_surrounding_whitespace = true,
			},

			swap = {
				enable = false, -- use tree-climber instead of
				swap_next = { ['<C-s>j'] = '@attribute.inner', ['<C-s>l'] = '@parameter.inner' },
				swap_previous = { ['<C-s>k'] = '@attribute.inner', ['<C-s>h'] = '@parameter.inner' },
			},

			move = {
				enable = false,
				set_jumps = false, -- whether to set jumps in the jumplist
				goto_next_start = { [']m'] = '@function.outer', [']]'] = '@block.outer' },
				goto_next_end = { [']M'] = '@function.outer', [']['] = '@block.outer' },
				goto_previous_start = { ['[m'] = '@function.outer', ['[['] = '@block.outer' },
				goto_previous_end = { ['[M'] = '@function.outer', ['[]'] = '@block.outer' },
			},

			lsp_interop = {
				enable = false,
				border = 'none',
				peek_definition_code = { ['<leader>df'] = '@function.outer', ['<leader>dF'] = '@class.outer' },
			},

		},
	},
}

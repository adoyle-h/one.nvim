local M = { 'stevearc/aerial.nvim', desc = 'Outline - aerial' }

local config = require('one.config').config
local keymap = vim.keymap.set

M.highlights = {
	AerialLine = { bg = '#3E1A00' },
	AerialFunction = { fg = '#589CFF' },
	AerialFunctionIcon = { fg = '#589CFF' },
	AerialObject = { fg = '#8DDA00' },
	AerialObjectIcon = { fg = '#8DDA00' },
	AerialArray = { fg = '#1C9A7B' },
	AerialArrayIcon = { fg = '#1C9A7B' },
	AerialVariable = { fg = '#B0B51D' },
	AerialVariableIcon = { fg = '#B0B51D' },
	AerialConstant = { fg = '#F46400' },
	AerialConstantIcon = { fg = '#F46400' },
}

M.keymaps = {
	{ 'n', '<space>o', ':AerialToggle<CR>', { silent = true, desc = 'Toggle the outline window' } },
}

local icons = {}
local Collapsed = config.kindSymbolMap.Collapsed
for key, val in pairs(config.kindSymbolMap) do
	icons[key] = val
	icons[key .. 'Collapsed'] = string.format('%s %s', Collapsed, val)
end

M.defaultConfig = {
	'aerial',
	{
		-- Priority list of preferred backends for aerial.
		-- This can be a filetype map (see :help aerial-filetype-map)
		backends = {
			-- "_" will be used as the default if the filetype is not present.
			['_'] = { 'lsp', 'treesitter', 'markdown' },
			markdown = { 'markdown' },
			man = { 'man' },
		},

		highlight_on_hover = true,

		layout = { default_direction = 'right', min_width = 20, max_width = 50 },

		show_guides = true,

		-- Use symbol tree for folding. Set to true or false to enable/disable
		-- Set to "auto" to manage folds if your previous foldmethod was 'manual'
		-- This can be a filetype map (see :help aerial-filetype-map)
		manage_folds = false,

		-- When you fold code with za, zo, or zc, update the aerial tree as well.
		-- Only works when manage_folds = true
		link_folds_to_tree = false,

		-- Fold code when you open/collapse symbols in the tree.
		-- Only works when manage_folds = true
		link_tree_to_folds = false,

		guides = {
			-- When the child item has a sibling below it
			mid_item = '├─ ',
			-- When the child item is the last in the list
			last_item = '└─ ',
			-- When there are nested child guides to the right
			nested_top = '│ ',
			-- Raw indentation
			whitespace = '  ',
		},

		filter_kind = {
			['_'] = {
				'Array',
				'Boolean',
				'Class',
				'Constant',
				'Constructor',
				'Enum',
				'EnumMember',
				'Event',
				'Field',
				'File',
				'Function',
				'Interface',
				'Key',
				'Method',
				'Module',
				'Namespace',
				'Null',
				'Number',
				'Object',
				'Operator',
				-- 'Package', -- @TODO Why "if" condition is a Package kind?
				'Property',
				'String',
				'Struct',
				'TypeParameter',
				'Variable',
			},
		},

		icons = {
			['_'] = icons,

			markdown = vim.tbl_extend('force', icons, { Interface = '', InterfaceCollapsed = Collapsed }),

			help = vim.tbl_extend('force', icons,
				{ Interface = '', InterfaceCollapsed = Collapsed .. ' ' }),

			man = vim.tbl_extend('force', icons,
				{ Interface = '', InterfaceCollapsed = Collapsed .. ' ' }),
		},

		autoFoldLevel = 1,
	},
}

function M.config()
	require('aerial').setup(config.aerial)

	local has_t, telescope = pcall(require, 'telescope')
	if has_t then
		telescope.setup({
			extensions = {
				aerial = {
					-- Display symbols as <root>.<parent>.<symbol>
					show_nesting = true,
				},
			},
		})
		telescope.load_extension('aerial')
	end
end

M.filetypes = {
	aerial = function(args)
		local aerial = require('aerial')
		local bufnr = args.buf

		aerial.tree_set_collapse_level(bufnr, config.aerial.autoFoldLevel)

		keymap('n', '<C-h>', function()
			aerial.up(-1, 1)
		end, { buffer = bufnr })

		keymap('n', '<C-l>', function()
			aerial.up(1, 1)
		end, { buffer = bufnr })
	end,
}

return M

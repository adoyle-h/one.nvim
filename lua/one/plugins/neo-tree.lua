local util = require('one.util')

local executable = vim.fn.executable

local M = {
	'nvim-neo-tree/neo-tree.nvim',
	branch = 'v2.x',
	config = function(config)
		require('neo-tree').setup(config.neotree)
	end,
}

local function keymapCopy(state)
	-- NeoTree is based on [NuiTree](https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/tree)
	-- The node is based on [NuiNode](https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/tree#nuitreenode)
	local node = state.tree:get_node()
	local filepath = node:get_id()
	local filename = node.name
	local modify = vim.fn.fnamemodify

	local results = {
		filepath,
		modify(filepath, ':.'),
		modify(filepath, ':~'),
		filename,
		modify(filename, ':r'),
		modify(filename, ':e'),
	}

	-- absolute path to clipboard
	local i = vim.fn.inputlist({
		'Choose to copy to clipboard:',
		'1. Absolute path: ' .. results[1],
		'2. Path relative to CWD: ' .. results[2],
		'3. Path relative to HOME: ' .. results[3],
		'4. Filename: ' .. results[4],
		'5. Filename without extension: ' .. results[5],
		'6. Extension of the filename: ' .. results[6],
	})

	if i > 0 then
		local result = results[i]
		if not result then return print('Invalid choice: ' .. i) end
		vim.fn.setreg('"', result)
	end
end

local moveToLastSibling = function(state)
	local tree = state.tree
	local node = tree:get_node()
	local siblings = tree:get_nodes(node:get_parent_id())
	require('neo-tree.ui.renderer').focus_node(state, siblings[#siblings]:get_id())
end

local moveToFirstSibling = function(state)
	local tree = state.tree
	local node = tree:get_node()
	local siblings = tree:get_nodes(node:get_parent_id())
	require('neo-tree.ui.renderer').focus_node(state, siblings[1]:get_id())
end

local moveToPreviousSibling = function(state)
	local tree = state.tree
	local node = tree:get_node()
	local siblings = tree:get_nodes(node:get_parent_id())

	local idx = 0
	for i, v in pairs(siblings) do
		if v == node then
			idx = i - 1
			break
		end
	end
	if idx > 0 then --
		require('neo-tree.ui.renderer').focus_node(state, siblings[idx]:get_id())
	end
end

local moveToNextSibling = function(state)
	local tree = state.tree
	local node = tree:get_node()
	local siblings = tree:get_nodes(node:get_parent_id())

	local idx = 0
	for i, v in pairs(siblings) do
		if v == node then
			idx = i + 1
			break
		end
	end
	if idx > 0 and idx <= #siblings then --
		require('neo-tree.ui.renderer').focus_node(state, siblings[idx]:get_id())
	end
end

M.defaultConfig = function(config)
	local symbols = config.symbolMap

	local filter = require('neo-tree.sources.filesystem.lib.filter')

	local hide_by_name = {}
	util.tbl_concat(hide_by_name, config.ignore.fileSearch.directories)
	util.tbl_concat(hide_by_name, config.ignore.fileSearch.files)

	local components = {
		symlink = function(conf, node, state)
			if node.is_link then
				return {
					text = string.format(conf.format or '→ %s', util.relative(node.path, node.link_to)),
					highlight = conf.highlight or 'NeoTreeSymbolicLinkTarget',
				}
			else
				return {}
			end
		end,

		exectuable = function(conf, node)
			local path = node.path
			if node.is_link then path = node.link_to end
			local text = ''
			if executable(path) == 1 then text = conf.symbol or symbols.EXECUTABLE end
			return { text = text, highlight = conf.highlight or 'NeoTreeFileExecutable' }
		end,
	}

	local conf = {
		'neotree',
		{
			sources = { 'filesystem', 'buffers', 'git_status' },
			log_level = 'warn',
			close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
			popup_border_style = 'rounded',
			enable_git_status = true,
			enable_diagnostics = true,
			sort_case_insensitive = false, -- used when sorting files and directories in the tree
			sort_function = nil, -- use a custom function for sorting files and directories in the tree
			use_popups_for_input = true,

			default_component_configs = {
				container = {
					enable_character_fade = false,
					-- width = 'fit_content',
				},

				indent = {
					indent_size = 2,
					padding = 1, -- extra padding on left hand side
					-- indent guides
					with_markers = true,
					indent_marker = '│',
					last_indent_marker = '└',
					highlight = 'NeoTreeIndentMarker',
					-- expander config, needed for nesting files
					with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
					expander_collapsed = '',
					expander_expanded = '',
					expander_highlight = 'NeoTreeExpander',
				},

				icon = {
					folder_closed = '',
					folder_open = '',
					folder_empty = '',
					-- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
					-- then these will never be used.
					default = '',
					highlight = 'NeoTreeFileIcon',
				},

				modified = { symbol = '', highlight = 'NeoTreeModified' },

				name = { trailing_slash = false, use_git_status_colors = true, highlight = 'NeoTreeFileName' },

				git_status = {
					symbols = {
						added = symbols.ADDED,
						modified = symbols.MODIFIED,
						deleted = symbols.DELETED,
						renamed = symbols.RENAMED,
						untracked = symbols.GIT_UNTRACKED,
						ignored = symbols.GIT_IGNORED,
						unstaged = symbols.GIT_UNSTAGED,
						staged = symbols.GIT_STAGED,
						conflict = symbols.GIT_CONFLICT,
					},
				},
			},

			renderers = {
				directory = {
					{ 'indent' },
					{ 'icon' },
					{ 'current_filter' },
					{
						'container',
						content = {
							{ 'name', zindex = 10 },
							{ 'symlink', zindex = 10, highlight = 'NeoTreeSymbolicLinkTarget' },
							{ 'clipboard', zindex = 10 },
							{ 'diagnostics', errors_only = true, zindex = 20, align = 'right', hide_when_expanded = true },
							{ 'git_status', zindex = 20, align = 'right', hide_when_expanded = true },
						},
					},
				},

				file = {
					{ 'indent' },
					{ 'icon' },
					{
						'container',
						content = {
							{ 'name', zindex = 10 },
							{ 'exectuable', zindex = 10, align = 'right' },
							{ 'symlink', zindex = 10, highlight = 'NeoTreeSymbolicLinkTarget' },
							{ 'clipboard', zindex = 10 },
							{ 'bufnr', zindex = 10 },
							{ 'modified', zindex = 20, align = 'right' },
							{ 'diagnostics', zindex = 20, align = 'right' },
							{ 'git_status', zindex = 20, align = 'right' },
						},
					},
				},
			},

			window = {
				position = 'left',
				width = 35,

				mapping_options = { noremap = true, nowait = true },
				mappings = {
					['?'] = 'show_help',
					['q'] = 'close_window',
					['<C-r>'] = 'refresh',
					['R'] = 'refresh',
					['r'] = 'rename',
					['<2-LeftMouse>'] = 'open_with_window_picker',
					['<cr>'] = 'open_with_window_picker',
					['o'] = 'open_with_window_picker',
					['O'] = function(state)
						local node = state.tree:get_node()
						local path = node:get_id()

						-- :h feature-list
						if vim.fn.has('mac') then
							vim.api.nvim_command('silent !open -R ' .. path) -- Open it in Finder
						elseif vim.fn.has('linux') then
							vim.api.nvim_command(string.format('silent !xdg-open "%s"', path))
						end
					end,
					['C'] = 'close_node',
					['s'] = 'split_with_window_picker',
					['v'] = 'vsplit_with_window_picker',
					['t'] = 'open_tabnew',
					['w'] = false,
					['<space>'] = false,
					['<bs>'] = false,
					['z'] = 'close_all_nodes',
					['Z'] = 'expand_all_nodes',
					['d'] = 'delete',
					['Y'] = keymapCopy,
					['y'] = 'copy_to_clipboard',
					['x'] = 'cut_to_clipboard',
					['p'] = 'paste_from_clipboard',
					['P'] = 'toggle_preview',
					['a'] = {
						'add',
						-- some commands may take optional config options, see `:h neo-tree-mappings` for details
						config = {
							show_path = 'relative', -- 'none', 'relative', 'absolute'
						},
					},
					['A'] = {
						'add_directory',
						config = {
							show_path = 'relative', -- 'none', 'relative', 'absolute'
						},
					},
					['c'] = {
						'copy',
						config = {
							show_path = 'relative', -- 'none', 'relative', 'absolute'
						},
					},
					['m'] = {
						'move',
						config = {
							show_path = 'relative', -- 'none', 'relative', 'absolute'
						},
					},
					['<'] = 'prev_source',
					['>'] = 'next_source',
					['<c-j>'] = moveToNextSibling,
					['<c-k>'] = moveToPreviousSibling,
					['J'] = moveToLastSibling,
					['K'] = moveToFirstSibling,
				},
			},

			nesting_rules = {},

			filesystem = {
				filtered_items = {
					visible = false, -- when true, they will just be displayed differently than normal items
					hide_dotfiles = false,
					hide_gitignored = true,
					hide_hidden = true, -- only works on Windows for hidden files/directories
					hide_by_name = hide_by_name,
					hide_by_pattern = { -- uses glob style patterns
						-- '*.meta',
						-- '*/src/*/tsconfig.json',
					},
					always_show = { -- remains visible even if other settings would normally hide it
						-- '.gitignored',
					},
					never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
						'.DS_Store',
						'thumbs.db',
					},
				},

				follow_current_file = false, -- This will find and focus the file in the active buffer every
				-- time the current file is changed while the tree is open.
				group_empty_dirs = false, -- when true, empty folders will be grouped together
				hijack_netrw_behavior = 'open_default', -- netrw disabled, opening a directory opens neo-tree
				-- in whatever position is specified in window.position
				-- 'open_current',  -- netrw disabled, opening a directory opens within the
				-- window like netrw would, regardless of window.position
				-- 'disabled',    -- netrw left alone, neo-tree does not handle opening dirs
				use_libuv_file_watcher = true, -- This will use the OS level file watchers to detect changes

				-- instead of relying on nvim autocmd events.
				window = {
					mappings = {
						['<C-h>'] = 'navigate_up',
						['<C-l>'] = 'set_root',
						['H'] = 'toggle_hidden',
						['/'] = function(state)
							filter.show_filter(state, true, true) -- let fuzzy_finder search as you type
						end,
						['<C-/>'] = 'clear_filter',
						['D'] = 'fuzzy_finder_directory',
						['f'] = 'filter_on_submit',
						['F'] = 'clear_filter',
						['[g'] = 'prev_git_modified',
						[']g'] = 'next_git_modified',
					},

					fuzzy_finder_mappings = { -- use a custom function for defining keymaps in popup input window
						['<down>'] = 'move_cursor_down',
						['<C-n>'] = 'move_cursor_down',
						['<up>'] = 'move_cursor_up',
						['<C-p>'] = 'move_cursor_up',
						['<C-j>'] = 'move_cursor_down',
						['<C-k>'] = 'move_cursor_up',
					},
				},

				components = components,
			},

			buffers = {
				follow_current_file = true, -- This will find and focus the file in the active buffer every
				-- time the current file is changed while the tree is open.
				group_empty_dirs = true, -- when true, empty folders will be grouped together
				show_unloaded = true,
				window = {
					position = 'float',
					mappings = { ['d'] = 'buffer_delete', ['<ESC>'] = 'close_window' },
				},
				components = components,
			},

			git_status = {
				window = {
					position = 'float',
					mappings = {
						['A'] = 'git_add_all',
						['u'] = 'git_unstage_file',
						['a'] = 'git_add_file',
						['r'] = 'git_revert_file',
						['gg'] = false,
						['<ESC>'] = 'close_window',
					},
				},
				components = components,
			},

			source_selector = {
				winbar = true, -- toggle to show selector on winbar
				statusline = false, -- toggle to show selector on statusline
				show_scrolled_off_parent_node = false, -- boolean
				tab_labels = {
					filesystem = '  File', -- string | nil
					buffers = '﬘ Buf',
					git_status = ' Git',
					diagnostics = '裂Diag',
					zk = '﬷ ZK',
				},
				content_layout = 'start', -- string
				tabs_layout = 'equal', -- string
				truncation_character = '…', -- string
				padding = 0, -- int | { left: int, right: int }
				separator = nil,
				separator_active = nil, -- set separators around the active tab. nil falls back to `source_selector.separator`
				highlight_tab = 'NeoTreeTabInactive',
				highlight_tab_active = 'NeoTreeTabActive',
				highlight_background = 'NeoTreeTabInactive',
				highlight_separator = 'NeoTreeTabSeparatorInactive',
				highlight_separator_active = 'NeoTreeTabSeparatorActive',
			},

			diagnostics = {
				components = {
					linenr = function(_config, node)
						local lnum = tostring(node.extra.diag_struct.lnum + 1)
						local pad = string.rep(' ', 4 - #lnum)
						return {
							{ text = pad .. lnum, highlight = 'LineNr' },
							{ text = '▕ ', highlight = 'NeoTreeDimText' },
						}
					end,
				},

				renderers = {
					file = {
						{ 'indent' },
						{ 'icon' },
						{ 'grouped_path' },
						{ 'name', highlight = 'NeoTreeFileNameOpened' },
						{ 'diagnostic_count', highlight = 'NeoTreeDimText', severity = 'Error', right_padding = 0 },
						{ 'diagnostic_count', highlight = 'NeoTreeDimText', severity = 'Warn', right_padding = 0 },
						{ 'diagnostic_count', highlight = 'NeoTreeDimText', severity = 'Info', right_padding = 0 },
						{ 'diagnostic_count', highlight = 'NeoTreeDimText', severity = 'Hint', right_padding = 0 },
						{ 'clipboard' },
					},
					diagnostic = { { 'indent' }, { 'icon' }, { 'linenr' }, { 'name' } },
				},
			},
		},
	}

	if pcall(require, 'neo-tree/sources/zk') then
		table.insert(conf[2].sources, 'zk')
		conf[2].zk = {
			follow_current_file = true,
			window = { mappings = { ['n'] = 'change_query' } },
			components = components,
		}
	end

	return conf
end

M.highlights = function(config)
	local c = config.colors
	local activeBG = c.darkBlue

	return {
		NeoTreeNormalNC = { bg = c.NC_BG },
		NeoTreeSymbolicLinkTarget = { fg = c.cyan },
		NeoTreeDirectoryName = { fg = c.blue },
		NeoTreeDirectoryIcon = { fg = c.purple },
		NeoTreeRootName = { fg = c.purple },
		NeoTreeFileIcon = { fg = c.blue },
		NeoTreeFileName = { fg = c.white },
		NeoTreeFileNameOpened = { fg = c.purple },
		NeoTreeIndentMarker = { fg = c.grey4 },
		NeoTreeTitleBar = { fg = c.BG, bg = c.purple },
		NeoTreeFloatTitle = { fg = c.BG, bg = c.purple },
		NeoTreeGitAdded = { fg = c.green },
		NeoTreeGitConflict = { fg = c.blue },
		NeoTreeGitDeleted = { fg = c.red },
		NeoTreeGitModified = { fg = c.yellow },
		NeoTreeGitIgnored = { fg = c.grey4 },
		NeoTreeGitUntracked = { fg = c.grey4 },
		NeoTreeModified = { fg = c.red },
		NeoTreeFileExecutable = { fg = c.blue },
		NeoTreeGitUnstaged = { fg = c.yellow },
		NeoTreeTabActive = { fg = c.blue, bg = activeBG, bold = true },
		NeoTreeTabInactive = { fg = c.grey4, bg = c.grey1, bold = true },
		NeoTreeTabSeparatorActive = { fg = c.black, bg = activeBG },
		NeoTreeTabSeparatorInactive = { fg = c.black, bg = c.grey1 },
	}
end

M.keymaps = {
	{ 'n', '<space>b', ':Neotree toggle show buffers<CR>', { silent = true } },

	{ 'n', '<space>g', ':Neotree toggle show git_status<CR>', { silent = true } },

	{ 'n', '<space>m', ':Neotree toggle reveal<CR>', { silent = true } },

	{ 'n', '<space>M', ':Neotree focus reveal<CR>', { silent = true } },
}

return M

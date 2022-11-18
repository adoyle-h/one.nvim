-- NOTE: nvim-treesitter has many Breaking Changes
-- Notice of Breaking Changes: https://github.com/nvim-treesitter/nvim-treesitter/issues/2293
local M = {
	'treesitter',

	requires = { 'nvim-treesitter/nvim-treesitter' },

	deps = {
		require('one.plugins.treesitter.context'),
		require('one.plugins.treesitter.rainbow'),
		require('one.plugins.treesitter.pairs'),
		require('one.plugins.treesitter.playground'),
	},

	highlights = require('one.plugins.treesitter.highlights'),
}

M.defaultConfig = {
	'treesitter',
	{
		prefer_git = false,
		-- https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
		ensure_installed = {}, -- A list of parser names, or "all",
		auto_install = false,
		sync_install = false, -- Install parsers synchronously (only applied to `ensure_installed`)
		ignore_install = {}, -- List of parsers to ignore installing (for "all")

		highlight = {
			-- `false` will disable the whole extension
			enable = true, -- `false` will disable the whole extension

			-- list of language that will be disabled.
			-- NOTE: these are the names of the parsers and not the filetype.
			-- (for example if you want to disable highlighting for the `tex` filetype,
			-- you need to include `latex` in this list as this is the name of the parser)
			disable = function(lang, buf)
				if vim.tbl_contains({
					'markdown', -- Use my markdown highlights instead of
					'help', -- The help use tree-sitter-vimdoc as parser. But currently its highlights is poor than builtin.
				}, lang) then return true end

				-- To disable highlight when open large file
				local max_filesize = 100 * 1024 -- 100 KB
				local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
				if ok and stats and stats.size > max_filesize then return true end
				return false
			end,

			-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
			-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
			-- Using this option may slow down your editor, and you may see some duplicate highlights.
			-- Instead of true it can also be a list of languages
			additional_vim_regex_highlighting = false,
		},

		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = 'vn',
				node_incremental = 'vn',
				node_decremental = 'vN',
				scope_incremental = 'vm',
			},
		},

		playground = {
			enable = true,
			disable = {},
			updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
			persist_queries = false, -- Whether the query persists across vim sessions
			keybindings = {
				toggle_query_editor = 'o',
				toggle_hl_groups = 'i',
				toggle_injected_languages = 't',
				toggle_anonymous_nodes = 'a',
				toggle_language_display = 'I',
				focus_language = 'f',
				unfocus_language = 'F',
				update = 'R',
				goto_node = '<cr>',
				show_help = '?',
			},
		},
	},
}

function M.config(config)
	local util = require('one.util')

	require('nvim-treesitter.install').prefer_git = config.treesitter.prefer_git

	if config.proxy.github then
		for _, parserConf in pairs(require('nvim-treesitter.parsers').get_parser_configs()) do
			parserConf.install_info.url = parserConf.install_info.url:gsub('https://github.com/',
				util.proxyGithub('https://github.com/'))
		end
	end

	vim.opt.foldmethod = 'expr'
	vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'

	require('nvim-treesitter.configs').setup(config.treesitter)
end

return M

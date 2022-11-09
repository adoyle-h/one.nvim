local consts = require('one.consts')
local util = require('one.util')

local M = {
	'olimorris/persisted.nvim',
	desc = 'session manager',
	keymaps = { { 'n', '<space>s', ':ListSessions<CR>', { silent = true } } },
}

M.commands = function(config)
	return {
		ListSessions = {
			function()
				local pwd = vim.fn.getcwd()

				require('telescope').extensions.persisted.persisted {
					default_text = pwd:sub(#consts.HOME_DIR + 2),
					layout_config = { --
						height = { 0.8, min = 6, max = 15 },
						width = { 0.5, min = 60, max = 100 },
					},
				}
			end,
			{ desc = 'List sessions via telescope' },
		},

		ClearOldSessions = {
			function()
				local sessDir = config.persisted.save_dir
				vim.cmd(string.format('!find "%s" -type f -mtime +10d -exec rm {} \\;', sessDir))
			end,
			{ desc = 'Clear session files which modified time older than 10 days' },
		},
	}
end

M.config = function(config)
	local opts = config.persisted

	local save_dir = vim.fs.normalize(opts.save_dir)
	if not vim.endswith(save_dir, '/') then
		save_dir = save_dir .. '/'
		opts.save_dir = save_dir
	end
	local forbiddens = { '/', '/root/', consts.HOME_DIR .. '/' }
	if vim.tbl_contains(forbiddens, save_dir) then error('save_dir path is forbidden') end

	vim.opt.sessionoptions = opts.session_options

	opts.should_autosave = function()
		return not vim.tbl_contains(opts.ignored_filetypes, vim.bo.filetype)
	end

	require('persisted').setup(opts)

	if pcall(require, 'telescope') then
		require('telescope').load_extension('persisted') -- To load the telescope extension
	end
end

M.defaultConfig = function(config)
	local function safeClose()
		pcall(vim.cmd, 'NeoTreeClose')
		pcall(vim.cmd, 'AerialClose')
		pcall(vim.cmd, 'MundoHide')
		pcall(vim.cmd, 'TroubleClose')
	end

	return {
		'persisted',
		{
			-- Do not enable "globals". Because if you change a option value (such as 'fdm') in runtime,
			-- it will store/restore forever.
			session_options = { 'curdir', 'folds', 'tabpages', 'winpos' }, -- :h ssop
			save_dir = util.dataPath('sessions'), -- directory where session files are saved.
			command = 'VimLeavePre', -- the autocommand for which the session is saved
			silent = false, -- silent nvim message when sourcing session file
			use_git_branch = true, -- create session files based on the branch of the git enabled repository
			branch_separator = '@@', -- string used to separate session directory name from branch name
			autosave = true, -- automatically save session files when exiting Neovim
			autoload = false, -- automatically load the session for the cwd on Neovim startup
			on_autoload_no_session = nil, -- function to run when `autoload = true` but there is no session to load
			follow_cwd = true, -- change session file name to match current working directory if it changes
			allowed_dirs = nil, -- table of dirs that the plugin will auto-save and auto-load from
			ignored_dirs = nil, -- table of dirs that are ignored when auto-saving and auto-loading

			ignored_filetypes = vim.list_extend({ '', 'neoterm' }, config.ignore.fileTypesForSomePlugs),

			before_save = safeClose, -- function to run before the session is saved to disk

			after_save = nil, -- function to run after the session is saved to disk

			after_source = nil, -- function to run after the session is sourced

			telescope = { -- options for the telescope extension
				-- function to run before the session is sourced via telescope
				before_source = function()
					safeClose()
					vim.api.nvim_input('<ESC>:%bd<CR>') -- Close all open buffers
					vim.lsp.stop_client(vim.lsp.get_active_clients())
				end,

				-- function to run after the session is sourced via telescope
				after_source = function(session)
					vim.schedule(function()
						print('Loaded session: ' .. session.name)
					end)
				end,

				reset_prompt_after_deletion = false, -- whether to reset prompt after session deleted
			},
		},
	}
end

return M

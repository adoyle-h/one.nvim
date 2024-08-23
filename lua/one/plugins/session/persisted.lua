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
				local path = pwd:gsub('^' .. consts.HOME_DIR, '')

				if #path > 1 and path:sub(1, 1) == '/' then path = path:sub(2) end

				require('telescope').extensions.persisted.persisted {
					default_text = path,
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

	-- Function to determine if a session should be saved
	opts.should_save = function()
		return not vim.tbl_contains(opts.ignored_filetypes, vim.bo.filetype)
	end

	require('persisted').setup(opts)

	if pcall(require, 'telescope') then
		require('telescope').load_extension('persisted') -- To load the telescope extension
	end
end

M.defaultConfig = function(config)
	return {
		'persisted',
		{
			autostart = true, -- Automatically start the plugin on load?
			-- should_save = function() return true end, -- this option will be defined in M.config()

			save_dir = util.dataPath('sessions'), -- directory where session files are saved.
			follow_cwd = true, -- change session file name to match current working directory if it changes
			use_git_branch = true, -- create session files based on the branch of the git enabled repository
			autoload = false, -- automatically load the session for the cwd on Neovim startup
			on_autoload_no_session = function() end, -- function to run when `autoload = true` but there is no session to load

			allowed_dirs = nil, -- table of dirs that the plugin will auto-save and auto-load from
			ignored_dirs = nil, -- table of dirs that are ignored when auto-saving and auto-loading

			telescope = { -- options for the telescope extension
				reset_prompt_after_deletion = false, -- whether to reset prompt after session deleted
			},

			-- Below are my extend options --

			-- Do not enable "globals". Because if you change a option value (such as 'fdm') in runtime,
			-- it will store/restore forever.
			session_options = { 'curdir', 'folds', 'tabpages', 'winpos' }, -- :h ssop
			ignored_filetypes = vim.list_extend({ '', 'neoterm' }, config.ignore.fileTypesForSomePlugs),
		},
	}
end

local function safeClose()
	pcall(vim.cmd, 'Neotree close')
	pcall(vim.cmd, 'AerialClose')
	pcall(vim.cmd, 'MundoHide')
	pcall(vim.cmd, 'TroubleClose')
end

local group = vim.api.nvim_create_augroup('PersistedHooks', {})

M.autocmds = {
	User = {
		{
			-- function to run before the session is saved to disk
			pattern = 'PersistedSavePre',
			group = group,
			callback = safeClose,
		},

		{
			pattern = 'PersistedTelescopeLoadPre',
			group = group,
			callback = function()
				safeClose()
				vim.api.nvim_input('<ESC>:%bd<CR>') -- Close all open buffers
				vim.lsp.stop_client(vim.lsp.get_active_clients())
			end,
		},

		{
			pattern = 'PersistedTelescopeLoadPost',
			group = group,
			callback = function(session)
				vim.schedule(function()
					print('Loaded session: ' .. session.name)
				end)
			end,
		},
	},
}

return M

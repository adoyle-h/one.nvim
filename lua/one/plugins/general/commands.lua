local M = { 'general.commands', desc = 'General functions and commands' }

local util = require('one.util')

M.commands = {
	Q = { ':q!', { desc = 'quit current buffer without saving' } },
	Qa = { ':qa!', { desc = 'quit all buffers without saving' } },
	CD = { ':lcd %:p:h', { desc = 'Change PWD in current buffer' } },

	Cheatsheet = {
		function()
			local lang = table.unpack(vim.split(string.lower(vim.v.lang), '.', { plain = true }))
			local url = 'https://vim.rtorr.com/lang/' .. lang
			vim.fn['openbrowser#open'](url)
		end,
		{ desc = 'Open vim cheatsheet in browser' },
	},

	GetWinConfig = {
		function()
			util.notify(vim.inspect(vim.api.nvim_win_get_config(0)))
		end,
		{ desc = 'Print current window config' },
	},

	FixLineBreak = {
		function()
			vim.cmd [[
				e ++ff=dos
				set ff=unix
				w
			]]
		end,
	},

	ProfileStart = {
		function()
			vim.cmd [[
				profile start profile.log
				profile func *
				profile file *
			]]
		end,
		{ desc = 'ProfileStart/ProfileEnd' },
	},

	ProfileEnd = {
		function()
			vim.cmd ':profile pause'
		end,
		{ desc = 'ProfileStart/ProfileEnd' },
	},

	OpenGithub = {
		function()
			local text = vim.fn.expand('<cfile>')
			text = text:gsub('^https?://github.com/', ''):gsub('^github.com/', '')
			vim.fn.OpenBrowser('https://github.com/' .. text)
		end,
		{ desc = 'Open github url in browser' },
	},
}

return M

local M = {}

local One = require('one.one')
local CM = require('one.config')
local FT = require('one.filetype')
local dynamic = require('one.plugins.completion.dynamic.source')

local set_keymap = vim.keymap.set
local set_hl = vim.api.nvim_set_hl
local set_cmd = vim.api.nvim_create_user_command
local sign_define = vim.fn.sign_define
local create_autocmd = vim.api.nvim_create_autocmd

local plugOpts = {
	{ name = 'config' },

	{
		name = 'signs',
		iterator = function(props, name)
			if not props then return end
			sign_define(name, props)
		end,
	},

	{
		name = 'keymaps',
		iterator = function(val)
			set_keymap(table.unpack(val))
		end,
	},

	{
		name = 'commands',
		iterator = function(props, name)
			if not props then return end
			if type(props) == 'table' then
				set_cmd(name, props[1], props[2] or {})
			else
				set_cmd(name, props, {})
			end
		end,
	},

	{
		name = 'autocmds',
		-- @param opts {table}
		-- @param events {string|string[]}
		iterator = function(opts, events)
			if not opts then return end
			if vim.tbl_islist(opts) then
				for _, value in pairs(opts) do create_autocmd(events, value) end
			else
				create_autocmd(events, opts)
			end
		end,
	},

	{
		name = 'filetypes',
		iterator = function(callback, lang)
			if not callback then return end
			FT.add(lang, callback)
		end,
	},

	{
		name = 'highlights',
		iterator = function(props, name)
			if not props then return end
			set_hl(0, name, props)
		end,
	},

	{
		name = 'telescopes',
		iterator = function(opts, name)
			if not opts then return end
			opts.name = name
			One.telescope.register(opts)
		end,
	},

	{
		name = 'completions',
		iterator = function(props, name)
			if not props then return end
			dynamic.add(name, props)
		end,
	},
}
M.plugOpts = plugOpts

local function handlePlugOptions(list, opt)
	if type(list) == 'function' then list = list(CM.config) end

	local iterator = opt.iterator
	if iterator then
		for key, val in pairs(list or {}) do --
			iterator(val, key)
		end
	end
end

function M.executePlugOptions(plug)
	for _, opt in pairs(plugOpts) do --
		handlePlugOptions(plug[opt.name], opt)
	end
end

function M.mergePlugDefaultConfig(node, plug)
	local defaultConfig = plug.defaultConfig

	if type(defaultConfig) == 'function' then defaultConfig = defaultConfig(CM.config) end

	if defaultConfig then
		if type(defaultConfig) ~= 'table' then
			error(string.format('[Plug "%s"] defaultConfig must be a table, but current value is %s.',
				plug.id, vim.inspect(defaultConfig)))
		end

		local fields = defaultConfig[1]
		if type(fields) == 'string' then fields = { fields } end

		for i, k in pairs(fields) do
			if i < #fields then
				if node[k] == nil then node[k] = {} end
				node = node[k]
			else
				local cur = node[k] or {}
				-- print(vim.inspect(defaultConfig[1]))
				node[k] = vim.tbl_deep_extend('keep', cur, defaultConfig[2])
			end
		end
	end
end

return M

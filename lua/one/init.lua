-- NOTE: Current Lua version is 5.1 in neovim 0.8
-- Learn nvim-lua: https://github.com/nanotee/nvim-lua-guide
local util = require('one.util')
local CM = require('one.config')
local consts = require('one.consts')
local PM = require('one.plugin-manager')
local One = require('one.one')
local FT = require('one.filetype')
local dynamic = require('one.plugins.completion.dynamic.source')

One.CM = CM
One.PM = PM
One.FT = FT
One.consts = consts
One.util = util
One.cmp = { add = dynamic.add }

local function preset()
	table.unpack = unpack
	vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'grey' }) -- THe initial float window is too ugly
end

-- @type PlugOpts see ../../doc/types.md

-- @param [opts] {table}
-- @param [opts.config] {table}
-- @param [opts.configFn] {function(config):table}
-- @param [opts.onlyPlugins] {string[]|nil}
--   It's useful for debug. Defaults to nil.
--   If set empty table, all builtin and user-defined plugins are disabled.
--   If set non-empty table, only these plugins are not disabled.
-- @param [opts.plugins] {PlugOpts[]|function(builtin: function(path: string):PlugOpts, config: Config):PlugOpts[]}
-- If passed a function, the first parameter is used to get the builtin PlugOpts.
-- The second parameter is the config of framework.
One.setup = function(opts)
	preset()

	CM.setup(opts.config or {})
	local config = CM.config

	if config.global then _G[config.global] = One end

	-- Do not set mapleader in vim-options plugin. Because user may use `onlyPlugins` to disable all plugins.
	vim.g.mapleader = config.leaderKey

	require('one.impatient')(One)
	PM.setup(opts)
	FT.setup()
end

return One

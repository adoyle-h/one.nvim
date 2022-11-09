local M = { 'move', desc = 'Plugins for fast cursor moving' }

M.deps = {
	require('one.plugins.move.jump'),
	-- require('one.plugins.move.choose-window'),
	-- require('one.plugins.move.window-selector'),
	require('one.plugins.move.window-picker'),
	require('one.plugins.move.caml-case'),
	require('one.plugins.move.accelerated'),
	require('one.plugins.move.line'),
	require('one.plugins.move.climber'),
	require('one.plugins.move.vim-move'),
}

return M

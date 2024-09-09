local M = { 'move', desc = 'Plugins for fast cursor moving' }

M.deps = {
	require('one.plugins.move.flash'),
	require('one.plugins.move.window-picker'),
	require('one.plugins.move.caml-case'),
	require('one.plugins.move.accelerated'),
	require('one.plugins.move.line'),
	require('one.plugins.move.climber'),
	require('one.plugins.move.vim-move'),
}

return M

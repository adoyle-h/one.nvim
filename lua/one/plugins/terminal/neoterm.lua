return {
	'kassio/neoterm',
	desc = 'provide an easier way to interact with neovim\'s terminal.',
	on = {
		-- LuaFormatter off
		'T', 'Tnew', 'Tmap', 'Tpos', 'TTestSetTerm', 'TTestLib', 'TTestClearStatus',
		'TREPLSetTerm', 'TREPLSendFile', 'TREPLSendLine', 'TREPLSendSelection', 'Topen', 'Ttoggle',
		-- LuaFormatter on
	},
	config = function()
		vim.g.neoterm_default_mod = 'belowright' -- :h mods
	end,
}

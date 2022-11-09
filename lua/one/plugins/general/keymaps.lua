return {
	'general.keymap',
	desc = 'Setting all general keymaps',

	deps = {
		require('one.keymap.general'),
		require('one.keymap.tab'),
		require('one.keymap.window'),
		require('one.keymap.diff'),
		require('one.keymap.editline'),
		require('one.keymap.search'),
		require('one.keymap.copy-paste'),
		require('one.keymap.space'),
		require('one.keymap.indent'),
		require('one.keymap.toggle'),
		require('one.keymap.jump'),
	},
}

local util = require('one.util')

return {
	src = 'https://raw.githubusercontent.com/adoyle-h/vim-plug/a/plug.vim',
	dist = util.dataPath('site/autoload/plug.vim'), -- Do not change the path!
	pluginDir = util.dataPath('plugins'), -- Plugin install directory.

	-- https://github.com/junegunn/vim-plug#global-options
	url_format = 'https://github.com/%s',
	threads = 8,
	timeout = 60,
	retries = 2,
	shallow = 1,
	-- window = 'vertical topleft new',
	window = 'VimPlugFloatWindow',
	pwindow = 'above 12new',
}

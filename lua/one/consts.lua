local function make()
	local levels = vim.log.levels

	local IS_WINDOWS = vim.fn.has('win32') == 1 or vim.fn.has('win32unix') == 1
	local PATH_SEPARATOR = '/'

	if IS_WINDOWS == true then PATH_SEPARATOR = '\\' end

	return {
		IS_WINDOWS = IS_WINDOWS,
		PATH_SEPARATOR = PATH_SEPARATOR,

		HOME_DIR = vim.fs.normalize('~/'):sub(1, -2),
		DATA_DIR = vim.fn.stdpath('data'),
		CACHE_DIR = vim.fn.stdpath('cache'),
		CONFIG_DIR = vim.fn.stdpath('config'),

		log = {
			levelMap = {
				[levels.ERROR] = 'ERROR',
				[levels.WARN] = 'WARN',
				[levels.INFO] = 'INFO',
				[levels.TRACE] = 'TRACE',
				[levels.DEBUG] = 'DEBUG',
				[levels.OFF] = 'OFF',
			},
		},
	}
end

return make()

local function make()
	local levels = vim.log.levels

	local IS_WINDOWS = vim.fn.has('win32') == 1 or vim.fn.has('win32unix') == 1
	local PATH_SEPARATOR = '/'
	if IS_WINDOWS == true then PATH_SEPARATOR = '\\' end

	local XDG_DATA_HOME = vim.fn.join({ vim.env.XDG_DATA_HOME or vim.env.HOME, '.local', 'share' }, PATH_SEPARATOR)
	local ONE_DIR = vim.fn.join({ XDG_DATA_HOME, '/nvim/plugins/one.nvim' }, PATH_SEPARATOR)

	return {
		IS_WINDOWS = IS_WINDOWS,
		PATH_SEPARATOR = PATH_SEPARATOR,

		HOME_DIR = vim.fs.normalize('~'),
		DATA_DIR = vim.fn.stdpath('data'),
		CACHE_DIR = vim.fn.stdpath('cache'),
		CONFIG_DIR = vim.fn.stdpath('config'),
		STATE_DIR = vim.fn.stdpath('state'),
		ONE_DIR = ONE_DIR,

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

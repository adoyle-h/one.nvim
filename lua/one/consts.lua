local function make()
	local levels = vim.log.levels

	local IS_WINDOWS = vim.fn.has('win32') == 1 or vim.fn.has('win32unix') == 1
	local PATH_SEPARATOR = '/'

	local ONE_DIR
	if vim.env.XDG_DATA_HOME then
		ONE_DIR = vim.env.XDG_DATA_HOME .. '/nvim/site/pack/user/start/one.nvim'
	else
		ONE_DIR = vim.env.HOME .. '/.local/share/nvim/site/pack/user/start/one.nvim'
	end

	if IS_WINDOWS == true then PATH_SEPARATOR = '\\' end

	return {
		IS_WINDOWS = IS_WINDOWS,
		PATH_SEPARATOR = PATH_SEPARATOR,

		HOME_DIR = vim.fs.normalize('~/'):sub(1, -2),
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

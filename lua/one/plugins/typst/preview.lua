local util = require('one.util')
local CONSTS = require('one.consts')

return {
	'chomosuke/typst-preview.nvim',
	ft = 'typst',
	version = '1.*',
	config = function(config)
		require('typst-preview').setup(config.typst.preview)
	end,
	defaultConfig = { { 'typst', 'preview' }, {
		-- Setting this true will enable logging debug information to
		-- `vim.fn.stdpath 'data' .. '/typst-preview/log.txt'`
		debug = false,

		-- Custom format string to open the output link provided with %s
		-- Example: open_cmd = 'firefox %s -P typst-preview --class typst-preview'
		open_cmd = nil,

		-- Custom port to open the preview server. Default is random.
		-- Example: port = 8000
		port = 0,

		-- Setting this to 'always' will invert black and white in the preview
		-- Setting this to 'auto' will invert depending if the browser has enable
		-- dark mode
		-- Setting this to '{"rest": "<option>","image": "<option>"}' will apply
		-- your choice of color inversion to images and everything else
		-- separately.
		invert_colors = 'never',

		-- Whether the preview will follow the cursor in the source file
		follow_cursor = true,

		-- Provide the path to binaries for dependencies.
		-- Setting this will skip the download of the binary by the plugin.
		-- Warning: Be aware that your version might be older than the one
		-- required.
		dependencies_bin = {
			['tinymist'] = util.pathJoin(CONSTS.DATA_DIR, 'mason', 'bin', 'tinymist'),
			['websocat'] = vim.fn.exepath('websocat'),
		},

		-- A list of extra arguments (or nil) to be passed to previewer.
		-- For example, extra_args = { "--input=ver=draft", "--ignore-system-fonts" }
		extra_args = nil,

		-- This function will be called to determine the root of the typst project
		-- get_root = function(path_of_main_file)
		-- 	local root = os.getenv 'TYPST_ROOT'
		-- 	if root then
		-- 		return root
		-- 	end
		-- 	return vim.fn.fnamemodify(path_of_main_file, ':p:h')
		-- end,

		-- This function will be called to determine the main file of the typst project.
		-- get_main_file = function(path_of_buffer)
		-- 	return path_of_buffer
		-- end,
	} },
}

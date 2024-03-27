return {
	'rest-nvim/rest.nvim',
	id = 'curl',

	keymaps = { { 'n', '<leader>cr', '<Plug>RestNvim' } },

	requires = { 'vhyrro/luarocks.nvim' },

	defaultConfig = {
		'curl',
		{
			client = 'curl',
			env_file = '.env',
			env_pattern = '\\.env$',
			env_edit_command = 'tabedit',
			-- Encode URL before making request
			encode_url = true,
			-- Skip SSL verification, useful for unknown certificates
			skip_ssl_verification = false,
			custom_dynamic_variables = {},
			logs = { level = 'info', save = true },
			result = {
				split = { horizontal = false, in_place = false, stay_in_current_window_after_split = true },
				behavior = {
					decode_url = true,
					show_info = { url = true, headers = true, http_info = true, curl_command = true },
					statistics = {
						enable = true,
						---@see https://curl.se/libcurl/c/curl_easy_getinfo.html
						stats = {
							{ 'total_time', title = 'Time taken:' },
							{ 'size_download_t', title = 'Download size:' },
						},
					},
					formatters = {
						json = 'jq',
						html = function(body)
							if vim.fn.executable('tidy') == 0 then return body, { found = false, name = 'tidy' } end
							local fmt_body = vim.fn.system({
								'tidy',
								'-i',
								'-q',
								'--tidy-mark',
								'no',
								'--show-body-only',
								'auto',
								'--show-errors',
								'0',
								'--show-warnings',
								'0',
								'-',
							}, body):gsub('\n$', '')

							return fmt_body, { found = true, name = 'tidy' }
						end,
					},
				},
			},
			-- Highlight request on run
			highlight = { enable = true, timeout = 150 },
			---Example:
			---
			---```lua
			---keybinds = {
			---  {
			---    "<localleader>rr", "<cmd>Rest run<cr>", "Run request under the cursor",
			---  },
			---  {
			---    "<localleader>rl", "<cmd>Rest run last<cr>", "Re-run latest request",
			---  },
			---}
			---
			---```
			---@see vim.keymap.set
			keybinds = {},
		},
	},

	config = function(config)
		require('rest-nvim').setup(config.curl)
	end,
}

return {
	'uga-rosa/translate.nvim',

	commands = function(config)
		return {
			TranslateTargetLang = {
				function(opts)
					config.translate.targetLang = opts.args
				end,
				{
					desc = 'Change default target language for translate plugin in runtime',
					range = 0,
					nargs = '+',
					complete = require('translate.command').get_complete_list,
				},
			},

			TranslateCommand = {
				function(opts)
					require('translate.config').config.default.command = opts.args
				end,
				{
					desc = 'Change default command for translate plugin in runtime',
					range = 0,
					nargs = '+',
					complete = function()
						return { 'google', 'translate_shell', 'deepl_free', 'deepl_pro' }
					end,
				},
			},
		}
	end,

	keymaps = function(config)
		return {
			{
				{ 'n', 'x' },
				'<M-t>',
				function()
					vim.cmd.Translate(config.translate.targetLang)
				end,
			},
		}
	end,

	config = function(config)
		require('translate').setup(config.translate)
	end,

	defaultConfig = {
		'translate',
		{
			targetLang = 'en', -- 'en', 'zh-CN', 'zh-TW'. See the completion list when typing `:Translate `.
			default = {
				-- (default) 'google': It uses Google Translate. It needs curl installed.
				-- 'translate_shell':
				--   It needs [trans](https://github.com/soimort/translate-shell) command installed.
				--   And it's recommended to set a [config](https://github.com/soimort/translate-shell/wiki/Configuration) file.
				-- 'deepl_pro' or 'deepl_free':
				--   You need the authorization key for DeepL API Pro/Free.
				--   It needs curl installed.
				command = 'google',
			},
		},
	},
}

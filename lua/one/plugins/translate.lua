return {
	'uga-rosa/translate.nvim',

	keymaps = function(config)
		return {
			{ { 'n', 'x' }, '<M-t>', string.format(':Translate %s<CR>', config.translate.targetLang) },
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

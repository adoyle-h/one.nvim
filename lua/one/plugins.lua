---@diagnostic disable-next-line: unused-local
return function(Plug, Load, config)
	Plug { 'adoyle-h/one.nvim', desc = 'The one.nvim' }

	------- Basic required plugins -------
	Load 'vim-options'
	Load 'plenary'
	Load 'devicons' -- Devicons for nvim plugins
	Plug 'MunifTanjim/nui.nvim'
	Load 'notify'
	Load 'notifier'
	Load 'treesitter'
	Load 'telescope'
	Plug { 'echasnovski/mini.nvim', version = '*' } -- use stable branch

	------------- UI plugins -------------
	Load 'dressing'
	Load 'noice'
	Load 'colors'
	Load 'lualine'
	Load 'indent-line'
	Load 'search'
	Load 'scrollbar' -- scrollbar must put after search, it relies on nvim-hlslens
	Load 'scroll'
	Load 'beacon'
	Load 'fold.pretty-fold'

	---------- Enhanced plugins ----------
	Load 'one'
	Load 'filetype'
	Load 'lsp' -- it must put after telescope plugin
	Load 'dap'
	Load 'completion'
	Load 'general.commands'
	Load 'general.keymaps'
	Load 'tabby'
	Load 'comment'
	Load 'aerial'
	Load 'format'
	Load 'git'
	Load 'highlight-words'
	Load 'increment'
	Load 'markdown'
	Load 'move'
	Load 'neo-tree' -- neo-tree must put after move plugin
	Load 'open-url'
	Load 'session'
	Load 'select'
	Load 'table'
	Load 'trailing'
	Load 'undotree'
	Load 'window'
	Load 'abbreviation'
	Load 'terminal'
	Load 'alpha' -- It must put after session plugin
	Load 'escape'
	Load 'match'
	Load 'test'
	Load 'yank'
	Load 'trouble' -- It must put after telescope and lsp plugin
	Load 'icon-picker'
	Load 'diff'
	Load 'js'
	Load 'crontab'
	Load 'live-cmd'
	Load 'translate'
	Load 'mark'
	Load 'yazi'
	Load 'ai'
	Load 'smartcolumn'

	Plug {
		'tyru/capture.vim',
		on = 'Capture',
		desc = [[
		:Capture <Ex-Command>" to pipe Ex command output to new buffer'.
		:Capture mess" to capture messages.
		:Capture lua print('hello')" to capture lua print
		:Capture echo globpath(&rtp, 'doc/*.txt')".
	]],
	}

	Plug {
		'lambdalisue/suda.vim',
		desc = 'read or write files with sudo command. :SudaRead and :SudaWrite',
	}

	Plug { 'adoyle-h/vim-eunuch', branch = 'adoyle', desc = 'UNIX commands. See :h eunuch' }
	Plug { 'tpope/vim-repeat', desc = 'Enable repeating other supported plugins with the . command' }
	Plug { 'mechatroner/rainbow_csv', desc = 'For .csv file', ft = { 'csv', 'tsv', 'tab' } }
	Plug 'rohanorton/lua-gf.nvim'
	Plug { 'hotoo/pangu.vim', ft = { 'markdown', 'vimwiki', 'text' } }

	Plug 'ryanoasis/vim-devicons' -- Devicons for old vimscript plugins. It should be put at last!!
end

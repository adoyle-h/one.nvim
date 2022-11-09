local M = {
	'scrooloose/nerdtree',
	on = {
		'NERDTreeMirrorToggle',
		'NERDTreeTabsToggle',
		'NERDTreeTabsFind',
		'NERDTreeToggle',
		'NERDTreeFind',
	},

	requires = {
		{
			'jistr/vim-nerdtree-tabs',
			on = {
				'NERDTreeMirrorToggle',
				'NERDTreeTabsToggle',
				'NERDTreeTabsFind',
				'NERDTreeToggle',
				'NERDTreeFind',
			},
		},
		{
			'Xuyuanp/nerdtree-git-plugin', -- It is slow in large git repo
			on = {
				'NERDTreeMirrorToggle',
				'NERDTreeTabsToggle',
				'NERDTreeTabsFind',
				'NERDTreeToggle',
				'NERDTreeFind',
			},
		},
		{
			'tiagofumo/vim-nerdtree-syntax-highlight',
			on = {
				'NERDTreeMirrorToggle',
				'NERDTreeTabsToggle',
				'NERDTreeTabsFind',
				'NERDTreeToggle',
				'NERDTreeFind',
			},
		},
	},
}

M.keymaps = {
	{ 'n', '<leader>nm', ':NERDTreeMirrorToggle<CR>', { silent = true } },
	{ 'n', '<leader>nf', ':NERDTreeTabsFind<CR>', { silent = true } },
	{ 'n', '<space>m', ':NERDTreeMirrorToggle<CR>' },
}

function M.config()
	vim.g.NERDTreeShowBookmarks = 1
	vim.g.NERDTreeMapChangeRoot = 'L'
	vim.g.NERDTreeMapUpdir = 'H'

	-- vim-nerdtree-syntax-highlight
	vim.g.NERDTreeFileExtensionHighlightFullName = 1
	vim.g.NERDTreeExactMatchHighlightFullName = 1
	vim.g.NERDTreePatternMatchHighlightFullName = 1
	vim.g.NERDTreeExtensionHighlightColor = {
		yaml = '1AB2AC',
		yml = '1AB2AC',
		vim = '61A275',
		js = 'F0DF64',
		jsx = 'F0DF64',
		json = 'CBB26F',
		ts = '2F7488',
		sh = '8CDE5A',
		bash = '8CDE5A',
		md = '7D876D',
		markd = '7D876D',
		markdown = '7D876D',
		log = '619D00',
		go = '1CADD5',
		svg = 'A8F927',
		toml = '955220',
		py = '3873A3',
		htm = 'E14D30',
		html = 'E14D30',
		rs = 'DDA586',
		rb = '6F1619',
		ex = '6D4B7D',
		exs = '6D4B7D',
		j2 = 'B21A1F',
		pdf = 'FC2122',
	}

	vim.g.NERDTreeExactMatchHighlightColor = {
		Dockerfile = '3EA0EB',
		Makefile = '447721',
		['.git'] = 'B19D54',
		['.gitignore'] = '877840',
	}

	-- nerdtree-git-plugin
	-- https://github.com/Xuyuanp/nerdtree-git-plugin/commit/c793d7445e088d5477da676443ebdf8517a32a73
	vim.g.NERDTreeGitStatusIgnoreSubmodules = 'all'
	vim.g.NERDTreeGitStatusIndicatorMapCustom = {
		Dirty = '',
		Modified = '',
		Staged = '✚',
		Untracked = '-',
		Renamed = '➜',
		Unmerged = '',
		Deleted = '✖',
		Clean = '✔︎',
		Ignored = '',
		Unknown = '',
	}

end

return M

local M = {
	'folke/noice.nvim',
	id = 'noice',
	event = 'VeryLazy',
	disable = true,

	keymaps = {
		{
			'n',
			'<space>n',
			function()
				if pcall(require, 'telescope') then
					require('telescope').extensions.noice.noice {}
				else
					if vim.bo.filetype == 'noice' then
						vim.api.nvim_feedkeys('q', '', false)
					else
						require('noice').cmd('history')
						vim.api.nvim_feedkeys('G', 'n', false)
					end
				end
			end,
		},

		{
			'',
			'<M-n>',
			':Noice dismiss<CR>',
			{ desc = 'Clean all visible messages', silent = true },
		},
	},

	highlights = function(config)
		local c = config.colors
		return { --
			-- NoiceMini = { fg = c.grey, bg = c.darkBlue },
			NoiceMini = { fg = c.grey, bg = c.darkBlue },
			NoiceMiniBorder = { fg = c.blue, bg = c.black },
			NoiceLSP = { fg = c.grey, bg = c.black },
			-- NoiceLSP = { fg = c.grey, bg = c.darkGreen },
			-- NoiceLSPBorder = { fg = c.green, bg = c.darkGreen },
			NoiceCmdlineIconSearch = { fg = c.match.fg },
			NoiceFormatEvent = { fg = c.green },
			NoiceFormatKind = { fg = c.yellow },
			NoiceCmdlineNormal = { fg = c.white, bg = c.black },
			NoiceCmdlineBorder = { fg = c.blue },
			NoiceLspProgressTitle = { fg = c.grey },
		}
	end,

	config = function(config)
		vim.o.lazyredraw = false -- noice.nvim requires to disable this option
		require('noice').setup(config.noice)
		if pcall(require, 'telescope') then require('telescope').load_extension('noice') end
	end,

	autocmds = {
		RecordingLeave = {
			group = vim.api.nvim_create_augroup('MacroRecording', { clear = true }),
			callback = function()
				-- Display a message when macro recording stops
				print('Macro recording stopped')
			end,
		},
	},
}

M.defaultConfig = function()
	local viewFormat = {
		'{date} ',
		'{event}',
		{ '{kind}', before = { '.', hl_group = 'NoiceFormatKind' } },
		' ',
		-- '{level} ',
		-- '{cmdline} ',
		'{title} ',
		'▏{message}',
	}

	local filterReadMsg = {
		event = 'msg_show',
		kind = '',
		any = {
			{ find = '^".+"  ?%d+ lines? %-%-%d+%%%-%-$' },
			{ find = '^".+"  ?%[.+%] %d+ lines? %-%-%d+%%%-%-$' },
			{ find = '^".+"  ?%d+L, %d+B$' },
			{ find = '^".+"  ?%[.+%] %d+L, %d+B$' },
		},
	}

	local filterNoLinesInBuf = {
		event = 'msg_show',
		kind = '',
		any = { { find = '%-%No lines in buffer%-%-$' }, { find = '%-%-缓冲区无内容%-%-$' } },
	}

	local filterSearch = { event = 'msg_show', kind = '', max_height = 1, find = '^[/?].+' }
	local filterSearchCount = { event = 'msg_show', kind = 'search_count' }
	local filterLineChanged = {
		event = 'msg_show',
		any = {
			{ find = '.+[；;] ?before #[0-9]+  .+' },
			{ find = '.+[；;] ?after #[0-9]+  .+' },
			{ find = '^少了 [0-9]+ 行$' },
			{ find = '^[0-9]+ fewer lines$' },
			{ find = '^1 line less$' },
			{ find = '^[0-9]+ line [><]ed [0-9]+ time' },
		},
	}

	local routes = {

		{ -- Hide diagnostics messages
			filter = { event = 'lsp', find = ' diagnostics_on_open ' },
			opts = { skip = true },
		},

		-- Hide read messages
		{ filter = filterReadMsg, opts = { skip = true } },

		{ -- Hide Search
			filter = filterSearchCount,
			opts = { skip = true },
		},

		{ -- Hide Search
			filter = filterSearch,
			opts = { skip = true },
		},

		{ -- Hide messages "--No lines in buffer--" or "--缓冲区无内容--"
			filter = filterNoLinesInBuf,
			opts = { skip = true },
		},

		{ -- Hide lines changed/removed/moved
			filter = filterLineChanged,
			opts = { skip = true },
		},

		-- Show recording messages
		{
			view = 'mini',
			filter = { event = 'msg_showmode', any = { { find = 'recording' }, { find = '记录' } } },
		},

	}

	local historyViewOpts = {
		-- options for the message history that you get with `:Noice`
		view = 'popup',
		opts = { --
			enter = true,
			format = viewFormat,
			size = { height = math.ceil(0.6 * vim.o.lines) },
		},

		filter = {
			any = {
				{ event = 'notify' },
				{ error = true },
				{ warning = true },
				{ event = 'msg_show' },
				{ event = 'lsp', kind = 'message' },
			},

			['not'] = {
				any = {
					filterReadMsg,
					filterNoLinesInBuf,
					filterSearch,
					filterSearchCount,
					filterLineChanged,
					{ event = 'msg_show', kind = 'echomsg', find = '^E486: Pattern not found:.+' },
				},
			},
		},
	}

	return {
		'noice',
		{
			cmdline = {
				enabled = true, -- enables the Noice cmdline UI
				view = 'cmdline', -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
				opts = { -- global options for the cmdline. See section on views
					border = { text = { top = '', top_align = 'left' } },
				},

				format = {
					-- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
					-- view: (default is cmdline view)
					-- opts: any options passed to the view
					-- icon_hl_group: optional hl_group for the icon
					-- title: set to anything or empty string to hide
					cmdline = { pattern = '^:', icon = ':', lang = 'vim' },
					search_down = { kind = 'search', pattern = '^/', icon = '', lang = 'regex' },
					search_up = { kind = 'search', pattern = '^%?', icon = ' ', lang = 'regex' },
					filter = { pattern = '^:%s*!', icon = '', lang = 'bash' },
					man = { pattern = '^:%s*Man%s+', icon = '󰗚', lang = 'bash' },
					lua = { pattern = '^:%s*lua%s+', icon = '', lang = 'lua' },
					help = { pattern = '^:%s*he?l?p?%s+', icon = '󰱼' },
					input = {}, -- Used by input()
					-- lua = false, -- to disable a format, set to `false`
				},
			},

			messages = {
				-- NOTE: If you enable messages, then the cmdline is enabled automatically.
				-- This is a current Neovim limitation.
				enabled = true, -- enables the Noice messages UI
				view = 'mini', -- default view for messages
				view_error = 'mini', -- view for errors
				view_warn = 'mini', -- view for warnings
				view_history = 'messages', -- view for :messages
				-- view_search = 'virtualtext', -- view for search count messages. Set to `false` to disable
				view_search = false, -- view for search count messages. Set to `false` to disable
			},

			popupmenu = {
				enabled = true, -- enables the Noice popupmenu UI
				---@type 'nui'|'cmp'
				backend = 'nui', -- backend to use to show regular cmdline completions
				-- Icons for completion item kinds (see defaults at noice.config.icons.kinds)
				kind_icons = {}, -- set to `false` to disable icons
			},

			-- default options for require('noice').redirect
			-- see the section on Command Redirection
			redirect = { view = 'popup', filter = { event = 'msg_show' } },

			-- You can add any custom commands below that will be available with `:Noice command`
			commands = {
				-- :Noice history
				history = historyViewOpts,

				-- :Noice last
				last = vim.tbl_deep_extend('force', {}, historyViewOpts, {
					filter_opts = {
						count = 10, -- show last 10 messages
					},
				}),

				-- :Noice errors
				errors = {
					-- options for the message history that you get with `:Noice`
					view = 'popup',
					opts = { enter = true, format = viewFormat },
					filter = { error = true },
					filter_opts = { reverse = true },
				},
			},

			notify = {
				-- Noice can be used as `vim.notify` so you can route any notification like other messages
				-- Notification messages have their level and other properties set.
				-- event is always "notify" and kind can be any log level as a string
				-- The default routes will forward notifications to nvim-notify
				-- Benefit of using Noice for this is the routing and consistent history view
				enabled = true,
				view = 'notify',
			},

			lsp = {
				progress = {
					enabled = true,
					-- Lsp Progress is formatted using the builtins for lsp_progress. See config.format.builtin
					-- See the section on formatting for more details on how to customize.
					format = 'lsp_progress',
					format_done = 'lsp_progress_done',
					throttle = 1000 / 100, -- frequency to update lsp progress message
					view = 'lsp-view',
				},

				override = {
					-- override the default lsp markdown formatter with Noice
					['vim.lsp.util.convert_input_to_markdown_lines'] = false,
					-- override the lsp markdown formatter with Noice
					['vim.lsp.util.stylize_markdown'] = false,
					-- override cmp documentation with Noice (needs the other options to work)
					['cmp.entry.get_documentation'] = false,
				},

				hover = {
					enabled = false,
					view = nil, -- when nil, use defaults from documentation
					opts = {}, -- merged with defaults from documentation
				},

				signature = {
					enabled = false,
					auto_open = {
						enabled = true,
						trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
						luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
						throttle = 50, -- Debounce lsp signature help request by 50ms
					},
					view = nil, -- when nil, use defaults from documentation
					opts = {}, -- merged with defaults from documentation
				},

				message = {
					-- Messages shown by lsp servers
					enabled = true,
					view = 'notify',
					opts = {},
				},

				-- defaults for hover and signature help
				documentation = {
					enabled = false,
					view = 'hover',

					opts = {
						lang = 'markdown',
						replace = true,
						render = 'plain',
						format = { '{message}' },
						win_options = { concealcursor = 'n', conceallevel = 3 },
					},
				},
			},

			markdown = {
				hover = {
					['|(%S-)|'] = vim.cmd.help, -- vim help links
					['%[.-%]%((%S-)%)'] = require('noice.util').open, -- markdown links
				},

				highlights = {
					['|%S-|'] = '@text.reference',
					['@%S+'] = '@parameter',
					['^%s*(Parameters:)'] = '@text.title',
					['^%s*(Return:)'] = '@text.title',
					['^%s*(See also:)'] = '@text.title',
					['{%S-}'] = '@parameter',
				},
			},

			health = {
				checker = false, -- Disable if you don't want health checks to run
			},

			smart_move = {
				-- noice tries to move out of the way of existing floating windows.
				enabled = true, -- you can disable this behaviour here
				-- add any filetypes here, that shouldn't trigger smart move.
				excluded_filetypes = { 'cmp_menu', 'cmp_docs', 'notify' },
			},

			presets = {
				-- you can enable a preset by setting it to true, or a table that will override the preset config
				-- you can also add custom presets that you can enable/disable with enabled=true
				bottom_search = false, -- use a classic bottom cmdline for search
				command_palette = false, -- position the cmdline and popupmenu together
				long_message_to_split = false, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = false, -- add a border to hover docs and signature help
			},

			-- how frequently does Noice need to check for ui updates? This has no effect when in blocking mode.
			throttle = 1000 / 100,

			views = { ---@see section on views

				['mini'] = {
					reverse = false,
					align = 'message-left',
					timeout = 3000,
					position = { row = -2, col = -2 }, -- bottom-right of window
					format = { '{date} ', '{title} ', '▏{message}' },

					size = {
						max_height = math.ceil(0.2 * vim.o.lines),
						max_width = math.ceil(0.9 * vim.o.columns),
						min_width = 30,
						width = 'auto',
						height = 'auto',
					},

					border = {
						text = { top = '', top_align = 'left', bottom = '' },
						style = {
							{ '▐', 'NoiceMiniBorder' },
							{ ' ', 'NoiceMini' },
							{ ' ', 'NoiceMini' },
							{ ' ', 'NoiceMini' },
							{ ' ', 'NoiceMini' },
							{ ' ', 'NoiceMini' },
							{ '▐', 'NoiceMiniBorder' },
							{ '▐', 'NoiceMiniBorder' },
						},
						padding = { top = 0, bottom = 0, left = 1, right = 0 },
					},

					win_options = { winblend = 0 },
				},

				['lsp-view'] = {
					backend = 'mini',
					reverse = true,
					align = 'right',
					timeout = 2000,
					position = { row = 1, col = -2 }, -- top-right of window
					format = { '{message}' },

					size = {
						max_height = 5,
						max_width = math.ceil(0.5 * vim.o.columns),
						width = 'auto',
						height = 'auto',
					},

					border = {
						text = { top = ' LSP Progress ', top_align = 'right', bottom = '' },
						style = { { ' ', 'NoiceLSP' } },
						padding = { top = 0, bottom = 0, left = 1, right = 0 },
					},

					win_options = { winblend = 0, winhighlight = { Normal = 'NoiceLSP' } },
				},

				['cmdline'] = {
					backend = 'mini',
					relative = 'editor',
					align = 'message-left',
					timeout = 100,
					reverse = true,
					position = { row = -2, col = 0 },
					size = 'auto',
					zindex = 60,

					border = {
						style = {
							{ '╭', 'NoiceCmdlineBorder' },
							{ '─', 'NoiceCmdlineBorder' },
							{ '╮', 'NoiceCmdlineBorder' },
							{ '│', 'NoiceCmdlineBorder' },
							{ '╯', 'NoiceCmdlineBorder' },
							{ '─', 'NoiceCmdlineBorder' },
							{ '╰', 'NoiceCmdlineBorder' },
							{ '│', 'NoiceCmdlineBorder' },
						},
						padding = { left = 1, right = 1 },
					},

					win_options = {
						winblend = 0,
						winhighlight = { Normal = 'NoiceCmdlineNormal', IncSearch = '', Search = '' },
					},
				},

			},

			routes = routes,

			status = {}, --- @see section on statusline components

			format = { --- @see section on formatting
				telescope = { '{date} ', '{event} ', '{title} ', '{message}' },
				telescope_preview = {
					' {date} ',
					-- '{level} ',
					'{event}',
					{ '{kind}', before = { '.', hl_group = 'NoiceFormatKind' } },
					' {title}',
					'\n [{cmdline}]',
					'\n {message}',
				},

			},
		},
	}
end

return M

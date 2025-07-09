local util = require('one.util')

local M = {
	'olimorris/codecompanion.nvim',

	deps = {
		'ravitemer/codecompanion-history.nvim',
	},

	config = function(config)
		require('codecompanion').setup(config.codecompanion)
	end,
}

local display = {
	action_palette = {
		-- width = 95,
		-- height = 10,
		prompt = 'Prompt ', -- Prompt used for interactive LLM calls
		provider = 'default', -- Can be "default", "telescope", "fzf_lua", "mini_pick" or "snacks". If not specified, the plugin will autodetect installed providers.
		opts = {
			show_default_actions = true, -- Show the default actions in the action palette?
			show_default_prompt_library = true, -- Show the default prompt library in the action palette?
		},
	},

	chat = {
		auto_scroll = false,
		intro_message = 'Welcome to CodeCompanion! Press ? for more options',
		show_header_separator = false, -- Show header separators in the chat buffer? Set this to false if you're using an external markdown formatting plugin
		separator = '─', -- The separator between the different messages in the chat buffer
		show_references = true, -- Show references (from slash commands and variables) in the chat buffer?
		show_settings = false, -- Show LLM settings at the top of the chat buffer?
		show_token_count = true, -- Show the token count for each response?
		start_in_insert_mode = false, -- Open the chat buffer in insert mode?

		-- Change the default icons
		icons = {
			buffer_pin = ' ',
			buffer_watch = '👀 ',
		},

		-- Alter the sizing of the debug window
		debug_window = {
			---@return number|fun(): number
			width = vim.o.columns - 5,
			---@return number|fun(): number
			height = vim.o.lines - 2,
		},

		-- Options to customize the UI of the chat buffer
		window = {
			layout = 'vertical', -- float|vertical|horizontal|buffer
			position = nil, -- left|right|top|bottom (nil will default depending on vim.opt.splitright|vim.opt.splitbelow)
			border = 'single',
			height = 0.8,
			width = 0.45,
			relative = 'editor',
			full_height = true, -- when set to false, vsplit will be used to open the chat buffer vs. botright/topleft vsplit
			opts = {
				breakindent = true,
				cursorcolumn = false,
				cursorline = false,
				foldcolumn = '0',
				linebreak = true,
				list = false,
				numberwidth = 1,
				signcolumn = 'no',
				spell = false,
				wrap = true,
			},
		},

		---Customize how tokens are displayed
		---@param tokens number
		---@param adapter CodeCompanion.Adapter
		---@return string
		token_count = function(tokens, adapter)
			return ' (' .. tokens .. ' tokens)'
		end,
	},

	diff = {
		enabled = true,
		close_chat_at = 240, -- Close an open chat buffer if the total columns of your display are less than...
		layout = 'vertical', -- vertical|horizontal split for default provider
		opts = { 'internal', 'filler', 'closeoff', 'algorithm:patience', 'followwrap', 'linematch:120' },
		provider = 'default', -- default|mini_diff
	},
}

local keymaps = {
	options = {
		modes = {
			n = '?',
		},
		callback = 'keymaps.options',
		description = 'Options',
		hide = true,
	},
	completion = {
		modes = {
			i = '<C-_>',
		},
		index = 1,
		callback = 'keymaps.completion',
		description = 'Completion Menu',
	},
	send = {
		modes = {
			n = { '<CR>', '<C-s>' },
			i = '<C-s>',
		},
		index = 2,
		callback = 'keymaps.send',
		description = 'Send',
	},
	regenerate = {
		modes = {
			n = 'gr',
		},
		index = 3,
		callback = 'keymaps.regenerate',
		description = 'Regenerate the last response',
	},
	close = {
		modes = {
			n = 'q',
			i = '_',
		},
		index = 4,
		callback = 'keymaps.close',
		description = 'Close Chat',
	},
	stop = {
		modes = {
			n = '<C-c>',
			i = '_',
		},
		index = 5,
		callback = 'keymaps.stop',
		description = 'Stop Request',
	},
	clear = {
		modes = {
			n = 'gx',
		},
		index = 6,
		callback = 'keymaps.clear',
		description = 'Clear Chat',
	},
	codeblock = {
		modes = {
			n = 'gc',
		},
		index = 7,
		callback = 'keymaps.codeblock',
		description = 'Insert Codeblock',
	},
	yank_code = {
		modes = {
			n = 'gy',
		},
		index = 8,
		callback = 'keymaps.yank_code',
		description = 'Yank Code',
	},
	pin = {
		modes = {
			n = 'gp',
		},
		index = 9,
		callback = 'keymaps.pin_reference',
		description = 'Pin Reference',
	},
	watch = {
		modes = {
			n = 'gw',
		},
		index = 10,
		callback = 'keymaps.toggle_watch',
		description = 'Watch Buffer',
	},
	next_chat = {
		modes = {
			n = '<C-]>',
		},
		index = 11,
		callback = 'keymaps.next_chat',
		description = 'Next Chat',
	},
	previous_chat = {
		modes = {
			n = '<C-[>',
		},
		index = 12,
		callback = 'keymaps.previous_chat',
		description = 'Previous Chat',
	},
	next_header = {
		modes = {
			n = ']]',
		},
		index = 13,
		callback = 'keymaps.next_header',
		description = 'Next Header',
	},
	previous_header = {
		modes = {
			n = '[[',
		},
		index = 14,
		callback = 'keymaps.previous_header',
		description = 'Previous Header',
	},
	change_adapter = {
		modes = {
			n = 'ga',
		},
		index = 15,
		callback = 'keymaps.change_adapter',
		description = 'Change adapter',
	},
	fold_code = {
		modes = {
			n = 'gf',
		},
		index = 15,
		callback = 'keymaps.fold_code',
		description = 'Fold code',
	},
	debug = {
		modes = {
			n = 'gd',
		},
		index = 16,
		callback = 'keymaps.debug',
		description = 'View debug info',
	},
	system_prompt = {
		modes = {
			n = 'gs',
		},
		index = 17,
		callback = 'keymaps.toggle_system_prompt',
		description = 'Toggle the system prompt',
	},
	auto_tool_mode = {
		modes = {
			n = 'gta',
		},
		index = 18,
		callback = 'keymaps.auto_tool_mode',
		description = 'Toggle automatic tool mode',
	},
	goto_file_under_cursor = {
		modes = { n = 'gR' },
		index = 19,
		callback = 'keymaps.goto_file_under_cursor',
		description = 'Open the file under cursor in a new tab.',
	},
	copilot_stats = {
		modes = { n = 'gS' },
		index = 20,
		callback = 'keymaps.copilot_stats',
		description = 'Show Copilot usage statistics',
	},
}

local variables = {
	['my_var'] = {
		description = 'Explain what my_var does',
		callback = function()

		end,
		opts = {
			contains_code = false,
			--has_params = true,    -- Set this if your variable supports parameters
			--default_params = nil, -- Set default parameters
		},
	},
}

local slash_commands = {
	-- ['file'] = {
	-- 	-- Location to the slash command in CodeCompanion
	-- 	callback = 'strategies.chat.slash_commands.file',
	-- 	description = 'Select a file using Telescope',
	-- 	opts = {
	-- 		provider = 'telescope', -- Can be "default", "telescope", "fzf_lua", "mini_pick" or "snacks"
	-- 		contains_code = true,
	-- 	},
	-- },
}

local tools = {
	['my_tool'] = {
		description = 'Run a custom task',
		callback = function() end,
	},

	groups = {
		['my_group'] = {
			description = 'A custom agent combining tools',
			system_prompt = 'Describe what the agent should do',
			tools = {
				'cmd_runner',
				'insert_edit_into_file',
				-- Add your own tools or reuse existing ones
			},
			opts = {
				collapse_tools = true, -- When true, show as a single group reference instead of individual tools
			},
		},
	},
}

local strategies = {
	-- Change the default chat adapter
	chat = {
		adapter = 'openai',
		keymaps = keymaps,
		variables = variables,
		slash_commands = slash_commands,
		opts = {
			completion_provider = 'cmp', -- blink|cmp|coc|default

			--- https://codecompanion.olimorris.dev/configuration/chat-buffer.html#prompt-decorator
			---Decorate the user message before it's sent to the LLM
			---@param message string
			---@param adapter CodeCompanion.Adapter
			---@param context table
			---@return string
			prompt_decorator = function(message, adapter, context)
				return string.format([[<prompt>%s</prompt>]], message)
			end,
		},
	},

	inline = {
		adapter = 'openai',
		keymaps = {
			accept_change = {
				modes = { n = 'gy' },
				description = 'Accept the suggested change',
			},
			reject_change = {
				modes = { n = 'gn' },
				description = 'Reject the suggested change',
			},
		},
	},


	cmd = {
		adapter = 'openai',
	},

	tools = tools,
}

local extensions = {
	mcphub = {
		enabled = true,
		callback = 'mcphub.extensions.codecompanion',
		opts = {
			make_vars = true,
			make_slash_commands = true,
			show_result_in_chat = true,
		},
	},

	history = {
		enabled = true,
		opts = {
			-- Keymap to open history from chat buffer (default: gh)
			keymap = 'gh',
			-- Keymap to save the current chat manually (when auto_save is disabled)
			save_chat_keymap = 'sc',
			-- Save all chats by default (disable to save only manually using 'sc')
			auto_save = true,
			-- Number of days after which chats are automatically deleted (0 to disable)
			expiration_days = 90,
			-- Picker interface (auto resolved to a valid picker)
			picker = 'telescope', --- ("telescope", "snacks", "fzf-lua", or "default")
			---Optional filter function to control which chats are shown when browsing
			chat_filter = nil, -- function(chat_data) return boolean end
			-- Customize picker keymaps (optional)
			picker_keymaps = {
				rename = { n = 'r', i = '<M-r>' },
				delete = { n = 'd', i = '<M-d>' },
				duplicate = { n = '<C-y>', i = '<C-y>' },
			},
			---Automatically generate titles for new chats
			auto_generate_title = true,
			title_generation_opts = {
				---Adapter for generating titles (defaults to current chat adapter)
				adapter = nil, -- "copilot"
				---Model for generating titles (defaults to current chat model)
				model = nil, -- "gpt-4o"
				---Number of user prompts after which to refresh the title (0 to disable)
				refresh_every_n_prompts = 0, -- e.g., 3 to refresh after every 3rd user prompt
				---Maximum number of times to refresh the title (default: 3)
				max_refreshes = 3,
				format_title = function(original_title)
					-- this can be a custom function that applies some custom
					-- formatting to the title.
					return original_title
				end,
			},
			---On exiting and entering neovim, loads the last chat on opening chat
			continue_last_chat = false,
			---When chat is cleared with `gx` delete the chat from history
			delete_on_clearing_chat = false,
			---Directory path to save the chats
			dir_to_save = util.dataPath('codecompanion-history'),
			---Enable detailed logging for history extension
			enable_logging = false,

			-- Summary system
			summary = {
				-- Keymap to generate summary for current chat (default: "gcs")
				create_summary_keymap = 'gcs',
				-- Keymap to browse summaries (default: "gbs")
				browse_summaries_keymap = 'gbs',

				generation_opts = {
					adapter = nil, -- defaults to current chat adapter
					model = nil, -- defaults to current chat model
					context_size = 90000, -- max tokens that the model supports
					include_references = true, -- include slash command content
					include_tool_outputs = true, -- include tool execution results
					system_prompt = nil, -- custom system prompt (string or function)
					format_summary = nil, -- custom function to format generated summary e.g to remove <think/> tags from summary
				},
			},

			-- Memory system (requires VectorCode CLI)
			memory = {
				-- Automatically index summaries when they are generated
				auto_create_memories_on_summary_generation = true,
				-- Path to the VectorCode executable
				vectorcode_exe = 'vectorcode',
				-- Tool configuration
				tool_opts = {
					-- Default number of memories to retrieve
					default_num = 10,
				},
				-- Enable notifications for indexing progress
				notify = true,
				-- Index all existing memories on startup
				-- (requires VectorCode 0.6.12+ for efficient incremental indexing)
				index_on_startup = false,
			},
		},
	},
}

M.defaultConfig = { 'codecompanion', {
	adapters = {
		opts = {
			show_defaults = false, -- Set false, only display the adapters defined in your user configuration
		},

		-- ## Examples
		-- openai = function()
		-- 	return require('codecompanion.adapters').extend('openai', {
		-- 		schema = {
		-- 			model = {
		-- 				default = 'gpt-4.1',
		-- 			},
		-- 		},
		-- 	})
		-- end,

		-- mistral = function()
		-- 	return require('codecompanion.adapters').extend('ollama', {
		-- 		name = 'mistral', -- Give this adapter a different name to differentiate it from the default ollama adapter
		-- 		schema = {
		-- 			model = {
		-- 				default = 'mistral:7b',
		-- 			},
		-- 		},
		-- 	})
		-- end,
	},

	display = display,

	extensions = extensions,

	opts = {
		log_level = 'INFO',
		language = 'English',
		send_code = false,
	},

	strategies = strategies,
} }

M.keymaps = {
	{ { 'n', 'v', 'x' }, '<leader>cc', function() require('codecompanion').toggle() end, { desc = 'Toggle CodeCompanion chat', silent = true } },
	{ { 'n', 'v', 'x' }, '<leader>ca', ':CodeCompanionActions<CR>', { desc = 'Open the CodeCompanion actions palette', silent = true } },
}

return M

# 插件

## 内置插件

内置插件都放在目录 [./lua/one/plugins](./lua/one/plugins)。

内置插件在文件 [./lua/one/plugins.lua](./lua/one/plugins.lua) 中加载。

## 创建插件

举个例子，创建文件 `lua/my-plugin.lua`。

### 插件参数

```lua
return {
  -- string | nil. The name of plugin. It must be first.
  -- If the name has "/", such as "repo/name", the plugin manager (vim-plug/packer) will install the repo.
  -- If the name has not "/", no repo installed. User can name this plugin with any characters.
  'repo/name',

  -- common options
  desc = 'Plugin Description', -- string | nil.
  disable = false, -- boolean | nil. If true, this Plugin will not be loaded
  tag = '', -- string | nil. tag of the repository to use
  branch = '', -- string | nil. branch of the repository to use
  commit = '', -- string | nil. commit of the repository to use
  rtp = '', -- string | nil. Subdirectory that contains Vim plugin
  as = '', -- string | nil. Use different name for the plugin
  run = '' -- string | nil. Post-update hook (string or funcref)
  on = {'command'} -- string[] | nil. On-demand loading: Commands or <Plug>-mappings
  ft = {'lua'} -- string | string[] | nil. On-demand loading: File types
  lock = false, -- boolean | nil. Do not update unless explicitly specified

  -- Supporting more specifying options by plugin manager
  -- packer: https://github.com/wbthomason/packer.nvim#specifying-plugins
  -- vim-plug: https://github.com/junegunn/vim-plug#plug-options

  -- Specifies code to run before this plugin is loaded.
  -- User should not require lua module in this function.
  setup = function() end,

  -- Specifies code to run after this plugin is loaded.
  -- User can require lua module in this function.
  config = function(config)
    -- Put your code here. Like require('name').setup {config.PluginName}
  end,

  -- Set default config for current plugin
  -- User can require lua module in this function.
  defaultConfig = {
    'PluginName', -- string | string[]. Config key. If set {'plugin', 'path'}, the value store at `config.plugin.path`.
    {}, -- config value, must be a table
  },

  -- Set highlight groups. Parameters refer to ":h nvim_set_hl"
  highlights = {
    PluginHighlightGroup = { fg = 'white', bg = 'none' } ,
    HighlightName = false, -- false or nil. To cancel plugin default highlight
  },

  -- Set vim sign. Parameters refer to ":h sign_define"
  signs = {
    GitSignsAdd = { text = '┃', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
    SignName = false, -- false or nil. To cancel plugin default sign
  },

  -- Parameters refer to ":h nvim_set_keymap"
  keymaps = {
    { 'n', '<leader>k1', ':echo hello<CR>' },
    { '', '<leader>k2', function() print('hello') end, {desc = '"" means mode "n", "v", "o". see :h map'} },
    { '!', '<leader>k3', function() print('hello') end, {desc = '! means mode "i" and "c". See :h map!'} },
    { { 'i', 'n' }, '<leader>k4', function() print('hello') end },
  },

  -- Parameters refer to ":h nvim_create_user_command"
  commands = {
    TelescopeFiles = ':Telescope find_files' ,
    AerialTelescope = { ':Telescope aerial' },
    TrailingSpaces = function()
      require('whitespace-nvim').trim()
    end,
    ClearPreviews = { function require('goto-preview').close_all_win end },
    TestLuaSpec = {
      function()
        require('plenary.test_harness').test_directory(vim.fn.expand('%:p'))
      end,
      { desc = 'Run unit test on current lua spec file' },
    },
    CommandName = false, -- false or nil. To cancel plugin default command
  },

  autocmds = {
    LspAttach = { -- Parameters refer to ":h nvim_create_autocmd"
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        require('aerial').on_attach(client, args.buf)
      end,
    },

    VimEnter = false, -- false or nil. To cancel plugin default autocmd

    User = { -- User autocmds
      {
        pattern = { 'AlphaReady' },
        callback = function()
          vim.opt.cursorline = true
          vim.opt.showtabline = 0
        end,
      },
      {
        pattern = { 'AlphaClosed' },
        callback = function()
          vim.opt.showtabline = 2
        end,
      },
    },
  }

  filetypes = {
    ['null-ls-info'] = function(opts) -- Parameters refer to ":h nvim_create_autocmd" callback arguments
      vim.api.nvim_win_set_config(0, { border = 'rounded', height = 30 })
    end,

    lua = false, -- false or nil. To cancel plugin default filetype callback
  },

  completions = {
    today = { -- completion keyword
      callback = function() -- The returned value will be the completion text
        return os.date('%Y/%m/%d')
      end,
      cache = false, -- If true, callback returned value will be cached
    },

    today2 = false, -- false or nil. To cancel plugin default completion
  }

  -- Add telescope extensions
  telescopes = {
    ls = { -- extension name
      command = '!ls', -- vimscript or lua function
    },

    messages = false -- false or nil. To cancel plugin default telescope extension
  },
}
```

以下字段可以接受一个函数。该函数参数为 `config`，且必须返回一个 table。

`defaultConfig`, `signs`, `keymaps` `commands`, `autocmds`, `filetypes`, `highlights`, `telescopes`, `completions`

举个例子，

```lua
{
  defaultConfig = function(config)
    return {
      {'PluginName'},
      {},
    }
  end,

  highlights = function(config)
    local colors = config.colors
    return {
      PluginHighlightGroup = { fg = colors.white, bg = 'none' } ,
    },
  end,

  commands = function(config)
    return {
      AerialTelescope = { ':Telescope aerial' },
      -- 注意: 调用第三方模块必须放在函数里
      ClearPreviews = { require('goto-preview').close_all_win },
    }
  end,
}
```

### 使用插件

编辑你的 init.lua 文件

```lua
require('one').setup {
  plugins = {
    require('my-plugin'),
  },
}
```

把你的插件放在 `plugins` 里。

当 `plugins` 里的插件名与内置插件匹配时，你定义的配置项会覆盖内置插件的默认配置。
若没有匹配的，它则会作为新的插件加载。

## 禁用默认插件

```lua
require('one').setup {
  plugins = {
    {'keymap', disable = true} -- It will disable all keymaps defined in ./lua/one/keymap/
    {'lukas-reineke/indent-blankline.nvim', disable = true} -- It will disable plugin ./lua/one/plugins/indent-line.lua
  },
},
}
```

## 修改插件配置

例如改变 alpha 插件的布局，隐藏 nvim logo 与版本信息。

```lua
require('one').setup {
  configFn = function(config)
    -- default layout = {
    --   { type = 'padding', val = marginTop },
    --   getHeader(),
    --   getTitle('Press j,k to move cursor'),
    --   buttons,
    -- }
    local layout = config.alpha.layout
    layout[2] = { type = 'padding', val = 5 }

    -- Do not return config, only return the overridden parts
    return {
      alpha = { layout = layout },
    }
  end
}
```

## 重写 config 函数

如果修改配置太麻烦，你可以干脆重写 config 函数。

```lua
require('one').setup {
  plugins = {
    {
      'alpha',
      config = function()
        local dashboard = require('alpha.themes.dashboard')
        local button = dashboard.button

        require('alpha').setup {
          layout = {
            { type = 'text', val = 'hello', opts = { position = 'center' } },
            {
              type = 'group',
              val = { button('<leader>u', 'test', ':echo "test"<CR>') },
              opts = { spacing = 0 },
            },
          },
        }
      end,
    },
  }
}
```

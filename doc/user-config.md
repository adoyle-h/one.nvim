# User Config

Set your config to override default configs.

```lua
require('one').setup {
  config = {
    colors = { -- basic colors
      white = '#BEC0C4', -- frontground
      black = '#15181D', -- background
      cursorLine = '#252931',
    },

    ['mason-installer'] = {
      ensureInstalled = {
        'lua-language-server',
        'luaformatter',
        'bash-language-server',
      }
    }
  },

  -- Add your plugins or override plugin default options.
  -- More examples in ./lua/one/plugins.lua
  plugins = {
    -- { 'profiling', disable = false },
    -- { 'psliwka/vim-smoothie', disable = false },
  },
}
```

You can refer to [my init.lua][init.lua] to write your config.

You can override the default options of plugins. Read [Plugin - Using Plugin](./plugin.md#using-plugin).

## Default Config

Parts of default config written in [lua/one/config/default.lua](../lua/one/config/default.lua), and other parts written in `defaultConfig` option of each plugin.

Parts of default highlights written in [lua/one/config/colors.lua](../lua/one/config/colors.lua) and [lua/one/plugins/themes/onedarkpro.lua](../lua/one/plugins/themes/onedarkpro.lua), and other parts written in `highlights` option of each plugin.

## configFn(config)

Some plugin configs need the module required. Such as `sources` option for `null-ls`.
It must be defined in `configFn(config)` function.
The function must return a table that will be merged into `config` variable.

```lua
require('one').setup {
  configFn = function(config)
    local builtins = require('null-ls').builtins
    local codeActions = builtins.code_actions
    local diagnostics = builtins.diagnostics
    local formatting = builtins.formatting

    -- Do not return config, only return the overridden parts
    return {
      nullLS = {
        sources = {
          codeActions.eslint_d,
          codeActions.shellcheck,
          diagnostics.eslint_d,
          formatting.eslint_d.with {
            prefer_local = 'node_modules/.bin',
          },
          formatting.lua_format,
        },
      },
    }
  end,
}
```

**Notice**: Do not create keymaps and commands in `configFn`, it may be overridden by plugins.
Because `configFn` is invoked before all plugins' config/keymaps/commands/autocmds/filetypes/completions/signs/telescopes.

If you need to invoke `vim.keymap.set` and `vim.api.nvim_create_user_command`, please put codes after one.nvim setup. For example,

```lua
require('one').setup {}
vim.keymap.set('n', 'w', 'WWW', { noremap = true })
vim.api.nvim_create_user_command('Hellow', 'echo "world"', {})
```

## Override Plugin Options

You can override any [plugin options](./plugin.md#plugin-options) in `require('one').setup {plugins = {}}`. You can override highlights and keymaps.

## View Config

You can get config via `require('one.config').config` or `a.CM.config` in lua.

Also, there are two commands to view configs.
`:OneShowConfig` to view final merged config.
`:OneShowPlugins` to view disabled and enabled plugins.

Because using [inspect.lua](https://github.com/kikito/inspect.lua) to print configuration,
you may see tags such as `<table id>`. It is for preventing infinite loops.
You can search `--[[<table 28>--]]` to view its value for `<table 28>` in same buffer content.

For `<table id>`, `<function id>`, `<metatable>` tag explanations, read [inspect.lua](https://github.com/kikito/inspect.lua#examples-of-use).


<!-- links -->

[init.lua]: https://github.com/adoyle-h/neovim-config/blob/master/init.lua

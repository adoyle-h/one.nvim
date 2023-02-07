# 用户配置

你可以传入自定义配置来覆盖默认配置。

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

你可参考[我的 init.lua][init.lua] 来编写你的配置。

你可以覆盖插件的默认选项。详见 [插件 - 使用插件](./plugin.zh.md#使用插件)。

## 默认配置

部分默认配置写在 [lua/one/config/default.lua](../lua/one/config/default.lua)，部分写在插件的 `defaultConfig` 里。

部分默认颜色配置写在 [lua/one/colors/util.lua](../lua/one/colors/util.lua) 与 [lua/one/plugins/themes/onedarkpro.lua](../lua/one/plugins/themes/onedarkpro.lua)，另一部分写在插件的 `highlights` 参数里。

## configFn(config)

有些插件配置需要用到对应的模块。例如 `null-ls` 的 `sources` 配置项。你必须定义在 `configFn(config)` 函数。
函数的返回值必须是一个 table，它会被合并到 `config` 变量。

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

**注意**：别在 `configFn` 里创建 keymap 或者命令，它可能会被插件覆盖。
因为 `configFn` 在所有插件的 config/keymaps/commands/autocmds/filetypes/completions/signs/telescopes 之前调用。

如果你需要调用 `vim.keymap.set` 和 `vim.api.nvim_create_user_command`，请把代码放在 one.nvim setup 函数之后。例如，

```lua
require('one').setup {}
vim.keymap.set('n', 'w', 'WWW', { noremap = true })
vim.api.nvim_create_user_command('Hellow', 'echo "world"', {})
```

## 覆盖插件参数

通过 `require('one').setup {plugins = {}}`，你可以覆盖任何[插件参数](./plugin.zh.md#插件参数)。你可以覆盖配色和快捷键设置。

## 查看配置

你可以通过编写 lua 脚本访问 `require('one.config').config` 或 `a.CM.config` 获取配置信息.

同时，这里提供了两个命令来查看配置：
`:OneShowConfig` 查看最终合并的配置。
`:OneShowPlugins` 查看加载的和未加载的插件。

因为使用了 [inspect.lua](https://github.com/kikito/inspect.lua) 打印配置，
会有例如 `<table id>` 这样的标记。这是为了避免重复，对于 `<table 28>` 搜索文件内对应的 `--[[<table 28>--]]` 即可找到相应的值。
`<table id>`, `<function id>`, `<metatable>` 等标记的解释详见 [inspect.lua](https://github.com/kikito/inspect.lua#examples-of-use)。


<!-- links -->

[init.lua]: https://github.com/adoyle-h/neovim-config/blob/master/init.lua

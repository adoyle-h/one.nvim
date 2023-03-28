# Usage

[English](./README.md) | [中文](./README.zh.md)

## [Debug](./debug.md)

Tricks for debug. Such as disable all plugins.

## [Keymaps](./keymaps.md)

## [Commands](./commands.md)

## [Snippets](./snippet.md)

## LSP

The project uses [nvim-lspconfig][] and [null-ls][] to manage LSP clients.
And using [mason.nvim][] and [mason-installer][] to manege packages, which includes LSP, DAP, linters, formatters and null-ls packages.

- [nvim-lspconfig][]: provides a series of LSP client configurations that can be used out of the box. Please read [nvim-lspconfig document](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md).
- [null-ls][]: a virtual LSP client, which bridge to non-LSP commands (like eslint, prettier). Please read [null-ls documents](https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTIN_CONFIG.md).
- [mason.nvim][]: manege LSP, DAP, linters, formatters and null-ls packages.
- [mason-installer][]: auto install mason packages.


- Invoke `:Mason` or press `<Alt-m>` to view LSP installations.
- Invoke `:LspInfo` to show LSP for current file.
- Invoke `:NullLsInfo` to show LSP for current file.

The project only installs Lua LSP and Formatter by default.
You can refer to [mason-installer defaultConfig](../../lua/one/plugins/lsp/mason-installer.lua) and [ADoyle's init.lua](https://github.com/adoyle-h/neovim-config/blob/master/init.lua) to customize your own.

## Code Format

The code formatting is based on LSP. Using `lsp-format` instead of nvim builtin `vim.lsp.buf.format` to provide more flexible configurations. Read [lsp-format options](https://github.com/lukas-reineke/lsp-format.nvim#special-format-options).

You can set multi formatters to format codes at the same time. And you can also change the order of formatters by filetype.

The configs of formatter are at `lsp.format` and `nullLS.sources`.
Default to use the formatters defined in `nullLS.sources`, and then formatters defined in `lsp.format`.

## Telescope Extensions

There are many useful telescope extensions. Read [ad-telescope-extensions.nvim](https://github.com/adoyle-h/ad-telescope-extensions.nvim) and [lua/one/plugins/telescope/extensions.lua](../../lua/one/plugins/telescope/extensions.lua)

Use `<space>;` to view all telescope extensions.

## Window Picker

![window-picker.png](https://media.githubusercontent.com/media/adoyle-h/_imgs/master/github/one.nvim/window-picker.png)

Press `<C-w><C-w>` to open a picker to view all tabpages and windows.
Press `<CR>` to goto selected window or tabpage.

## Float Cmdline

This feature is disabled by default. Because it seems not stable.
You can enable it by below codes.

```lua
require('one').setup {
  plugins = {
    { 'noice', disable = false },
  },
}
```

It will hide cmdline. And popup window when `:`, `/`, `?` pressed.

![cmdline.png](https://media.githubusercontent.com/media/adoyle-h/_imgs/master/github/one.nvim/cmdline.png)

## Unloaded Plugins

For reduce installing and loading time, some plugins are available but disabled or not loaded by default.
You can enable them as required.

```lua
require('one').setup {
  plugins = function(load, config)
    -- Load the builtin plugins
    return {
      load('profiling'),
      load('funny', { disable = true }), -- You can pass options to override the default options of plugin.
      load('noice'),
    }
  end
}
```

The unloaded plugins list in [here](../available-but-not-loaded-plugins.md).

## Extend your plugins/highlights/commands and so on

```lua
local my = {}

my.highlights = function(config)
  local c = config.colors
  return { CmpGhostText = { fg = c.grey4, bg = c.darkBlue } }
end

my.commands = {
  Hello = ':echo world'
}

require('one').setup {
  plugins = { my },
}
```

## Global Variable

You can call the properties of one.nvim in runtime.

```
    ╭─────────────────────╮
    │ 𝕍 one.CM        CMD │
    │ 𝕍 one.FT        CMD │
    │ 𝕍 one.PM        CMD │
    │ 𝕍 one.cmp       CMD │
    │ 𝕍 one.util      CMD │
    │ 𝕍 one.setup     CMD │
    │ 𝕍 one.consts    CMD │
    │ 𝕍 one.telescope CMD │
    ╰─────────────────────╯
:lua one.
```

By default, it is assigned to global variable `one`. (Read the option `config.global = 'one'`)
You can change it to other variable name as you like.
Or set `false` or `nil` to prevent creating this global variable.

That's cool, isn't it?


<!-- links -->

[null-ls]: https://github.com/jose-elias-alvarez/null-ls.nvim
[nvim-lspconfig]: https://github.com/neovim/nvim-lspconfig
[mason.nvim]: https://github.com/williamboman/mason.nvim
[mason-installer]: ../../lua/one/plugins/lsp/mason-installer.lua

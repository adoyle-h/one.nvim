# 使用

[English](./README.md) | [中文](./README.zh.md)

## [Debug](./debug.md)

Debug 技巧。例如禁用所有插件。

## [快捷键](./keymaps.md)

## [命令](./commands.md)

## [文件格式 (Filetype)](./filetypes.md)

## [代码片段 (Snippet)](./snippet.md)

## LSP

本项目使用 [nvim-lspconfig][] 和 [null-ls][] 来配置 LSP 客户端，管理 LSP 与 Nvim 的连接。
使用 [mason.nvim][] 和 [mason-installer][] 来管理 LSP，DAP, Linter, Formatter 以及 null-ls 的第三方包。

- [nvim-lspconfig][]: 封装了一系列 LSP 客户端配置，能够开箱即用。详见[官方文档](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)。
- [null-ls][]: 是一个虚拟 LSP 客户端，可以将 eslint、prettier 这类非 LSP 的普通命令行转化为 LSP。详见 [null-ls 官方配置文档](https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTIN_CONFIG.md)。
- [mason.nvim][]: 管理 LSP，DAP, Linter, Formatter 以及 null-ls 的第三方包。
- [mason-installer][]: 自动安装 mason 包。


- 执行 `:Mason` 或者按 `<Alt-m>` 查看 LSP 安装情况。
- 执行 `:LspInfo` 查看当前文件使用的 LSP。
- 执行 `:NullLsInfo` 查看当前文件使用的 LSP。

本项目默认只安装了 Lua LSP 和 Formatter。你可以参考 [mason-installer 插件配置](../../lua/one/plugins/lsp/mason-installer.lua) 和 [ADoyle 的 init.lua](https://github.com/adoyle-h/neovim-config/blob/master/init.lua) 来定制自己的。

## 代码格式化

本项目基于 LSP 来格式化代码。
使用 `lsp-format` 代替 nvim 内置的 `vim.lsp.buf.format`，提供更灵活的自定义配置。详见 [lsp-format 选项](https://github.com/lukas-reineke/lsp-format.nvim#special-format-options)。

你可以指定多个 Formatter 同时格式化代码。你也可以根据 filetype 调整 Formatter 的调用顺序。

Formatter 配置在 `lsp.format` 与 `nullLS.sources`。
默认先使用定义在 `nullLS.sources` 的 Formatter，后使用定义在 `lsp.format` 的 Formatter。Formatter 执行顺序按定义顺序.

## Telescope 插件

本项目实现了很多有用的 Telescope 插件，详见 [ad-telescope-extensions.nvim](https://github.com/adoyle-h/ad-telescope-extensions.nvim) 和 [lua/one/plugins/telescope/extensions.lua](../../lua/one/plugins/telescope/extensions.lua)。

可使用 `<space>;` 快捷键查询所有 Telescope 插件。

## 窗口选择器

![window-picker.png](https://media.githubusercontent.com/media/adoyle-h/_imgs/master/github/one.nvim/window-picker.png)

按下 `<C-w><C-w>` 打开选择器浏览所有 Tab 和窗口。
按下 `<CR>` 跳转到对应的窗口或者 Tab。

### 浮动命令栏

该功能默认未开启，因为还不稳定。
你可以依照下面的代码启用。

```lua
require('one').setup {
  plugins = {
    { 'noice', disable = false },
  },
}
```

它会隐藏命令栏。当 `:`, `/`, `?` 按下会弹出窗口。

![cmdline.png](https://media.githubusercontent.com/media/adoyle-h/_imgs/master/github/one.nvim/cmdline.png)

## 未加载的插件

为了减少安装和加载插件的时间，有些插件虽然可用但默认禁用了。
你可以按需开启它们。

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

未加载的插件列表[在这](../available-but-not-loaded-plugins.md)。

## 扩展你自己的插件、高亮、命令等配置

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

## 全局变量

你可以在运行时操作 one.nvim 的属性。

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

它默认分配到全局变量 `one`。（看配置项 `config.global = 'one'`）
可以改成其他变量名，随你喜欢。或者设置 `false` 或 `nil`，不创建该全局变量。

这很酷，不是吗？


<!-- links -->

[null-ls]: https://github.com/jose-elias-alvarez/null-ls.nvim
[nvim-lspconfig]: https://github.com/neovim/nvim-lspconfig
[mason.nvim]: https://github.com/williamboman/mason.nvim
[mason-installer]: ../../lua/one/plugins/lsp/mason-installer.lua

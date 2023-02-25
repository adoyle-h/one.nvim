# One.nvim

用 Lua 编写的 Neovim 一体化配置框架。易配置，可扩展。

[English](./README.md) | [中文](./README.zh.md)

## 特性

- 用 Lua 管理 nvim 配置。所有配置项都可覆盖。详见[配置章节](#配置)。
- 充分使用 Neovim 功能：Native LSP、Float Window、Winbar。
- 支持的插件管理器：[lazy.nvim][], [vim-plug](https://github.com/junegunn/vim-plug), [packer.nvim][]。详见[插件管理器](#插件管理器)。
- 帅气的界面和配色。暗黑模式。支持真彩色、平滑滚动、滚动条、Dashboard。你可以修改任意配色。详见 [颜色和高亮](#颜色和高亮)。
- 支持配置 github 代理，在中国大陆可加快插件下载速度。详见[代理](./doc/usage/proxy.zh.md)。
- 集成了 120 多个 Vim/Nvim 插件。增强插件的使用体验，并且修复了一些插件的缺点。

  <details close>
  <summary>点击展开/折叠插件列表</summary>

  - 插件管理器: [lazy](lua/one/plugin-manager/lazy.lua) (默认) 或 [vim-plug](lua/one/plugin-manager/vim-plug.lua) 或 [packer](lua/one/plugin-manager/packer.lua)
  - Vim 选项: [vim-options](lua/one/plugins/vim-options.lua)
  - 工具函数: [plenary](https://github.com/nvim-lua/plenary.nvim) 和 [Penlight](https://github.com/lunarmodules/Penlight) 和 [nui](https://github.com/MunifTanjim/nui.nvim)
  - 面板: [alpha.nvim](lua/one/plugins/alpha.lua)
  - 大纲: [aerial](lua/one/plugins/aerial.lua) (默认) 或 [majutsushi/tagbar](lua/one/plugins/tagbar.lua)
  - 文件浏览器: [neo-tree](lua/one/plugins/neo-tree.lua) (默认) 或 [nerdtree](lua/one/plugins/nerdtree.lua) 或 [nvim-tree](lua/one/plugins/nvim-tree.lua)
  - 状态栏: [lualine](lua/one/plugins/lualine.lua) (默认) 或 [airline](lua/one/plugins/airline.lua)
  - Tab 栏: [tabby](lua/one/plugins/tabby.lua)
  - Buffer 栏: [barbar](lua/one/plugins/barbar.lua) 或 [bufferline](lua/one/plugins/bufferline.lua) (如果使用 Buffer 栏，你要禁用 Tab 栏插件)
  - 光标栏高亮: [beacon](lua/one/plugins/beacon.lua) (默认) 或 [specs.nvim](lua/one/plugins/specs.lua)
  - 滚动条: [nvim-scrollbar](lua/one/plugins/scrollbar.lua)
  - 平滑滚动: [neoscroll.nvim](lua/one/plugins/scroll.lua)
  - 会话: [persisted](lua/one/plugins/session/persisted.lua) (默认) 或 [possession](lua/one/plugins/session/possession.lua) 或 [xolox/vim-session](lua/one/plugins/session/vim-session.lua) 或 [rmagatti/auto-session](lua/one/plugins/session/auto-session.lua)
  - 模糊查找: [telescope](lua/one/plugins/telescope/main.lua) 与 [ctrlsf](lua/one/plugins/search/ctrlsf.lua)
  - Diagnostics 窗口: [trouble](lua/one/plugins/trouble.lua)
  - 撤销: [vim-mundo](lua/one/plugins/undotree.lua)
  - 语法高亮: [treesitter][] 与 [nvim-ts-rainbow](lua/one/plugins/treesitter/rainbow.lua) 与 [nvim-treesitter-pairs](lua/one/plugins/treesitter/pairs.lua)
  - 单词高亮: [vim-interestingwords](lua/one/plugins/highlight-words.lua)
  - 注释代码: [Comment.nvim](lua/one/plugins/comment.lua) (默认) 或 [nerdcommenter](lua/one/plugins/comment_nerd.lua)
  - LSP: [nvim-lspconfig](lua/one/plugins/lsp/main.lua) 与 [treesitter](lua/one/plugins/treesitter/init.lua) 与 [null-ls](lua/one/plugins/lsp/null-ls.lua) 与 [nlsp](lua/one/plugins/lsp/nlsp.lua) 与 [goto-preview](lua/one/plugins/lsp/preview.lua) 与 [lsp-toggle](https://github.com/adoyle-h/lsp-toggle.nvim)
  - DAP: [nvim-dap](lua/one/plugins/dap/init.lua)
  - 格式化: [lsp-format](lua/one/plugins/lsp/format.lua) 与 [editorconfig-vim](https://github.com/editorconfig/editorconfig-vim)
  - Formatter, Linter, LSP, DAP 管理器: [mason](lua/one/plugins/lsp/mason.lua) 与 [mason-installer](lua/one/plugins/lsp/mason-installer.lua)
  - 补全: [nvim-cmp](lua/one/plugins/completion/init.lua)
  - Snippets: [nvim-snippy](lua/one/plugins/completion/snippet.lua)
  - Markdown: [plasticboy/vim-markdown](lua/one/plugins/markdown/main.lua) 与 [markdown-preview](lua/one/plugins/markdown/preview.lua) 与 [headlines.nvim](lua/one/plugins/markdown/headlines.lua) 与 [vim-MarkdownTOC](lua/one/plugins/markdown/toc.lua)
  - 括号配对: [nvim-surround](lua/one/plugins/match/surround.lua) 与 [nvim-autopairs](lua/one/plugins/match/autopairs.lua) 与 [nvim-ts-autotag](lua/one/plugins/match/ts-autotag.lua) 与 [vim-matchup](lua/one/plugins/match/matchup.lua)
  - Git: [gitsigns](lua/one/plugins/git/sign.lua) 与 [lazygit](lua/one/plugins/git/lazygit.lua) 与 [diffview.nvim](https://github.com/sindrets/diffview.nvim)
  - 缩进基准线: [indent-blankline](lua/one/plugins/indent-line.lua)
  - 光标移动: [hop.nvim](lua/one/plugins/move/jump.lua) 与 [accelerated-jk](lua/one/plugins/move/accelerated.lua)
  - 窗口选择: [nvim-window-picker](lua/one/plugins/move/window-picker.lua) (默认) 或 [yorickpeterse/nvim-window](lua/one/plugins/move/window-selector.lua) 或 [vim-choosewin](lua/one/plugins/move/choose-window.lua)
  - 窗口大小调整: [simeji/winresizer](lua/one/plugins/window/resize.lua) 与 [windows.nvim](lua/one/plugins/window/maximize.lua)
  - Context: [aerial](lua/one/plugins/aerial.lua) (默认) 或 [navic](lua/one/plugins/navic.lua) 与 [nvim-treesitter-context](lua/one/plugins/treesitter/context.lua)
  - 文本对齐: [vim-easy-align](lua/one/plugins/align.lua)
  - 书签: [vim-bookmarks](lua/one/plugins/bookmark.lua)
  - 标记: [marks.nvim](lua/one/plugins/mark.lua)
  - 日历: [mattn/calendar-vim](lua/one/plugins/calendar.lua)
  - Curl: [rest.nvim](lua/one/plugins/curl.lua)
  - Icons: [devicons](lua/one/plugins/devicons.lua) 与 [icon-picker](lua/one/plugins/icon-picker.lua)
  - UI 增强: [dressing](lua/one/plugins/dressing.lua) 和 [noice](lua/one/plugins/noice.lua)
  - 启动加速: [impatient.nvim][]
  - 跳出输入模式的快捷键: [better-escape.nvim](lua/one/plugins/escape.lua)
  - Increment: [increment-activator](lua/one/plugins/increment.lua)
  - Filetype: [filetype.nvim](lua/one/plugins/filetype.lua)
  - Latex: [nabla](lua/one/plugins/latex.lua)
  - 通知: [notify](lua/one/plugins/notify.lua) (默认) 或 [notifier](lua/one/plugins/notifier.lua)
  - 性能调优: [vim-startuptime](lua/one/plugins/profiling.lua)
  - Text-Objects: [wildfire](lua/one/plugins/select.lua) 与 [nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects)
  - 表格: [vim-table-mode](lua/one/plugins/table.lua)
  - 终端: [neoterm](lua/one/plugins/terminal/neoterm.lua)
  - 测试: [nvim-test](lua/one/plugins/test.lua)
  - TODO 注释: [todo-comments](lua/one/plugins/todo.lua)
  - 尾空格: [whitespace](lua/one/plugins/trailing.lua)
  - 复制粘贴: [yanky](lua/one/plugins/yank.lua)
  - 禅模式: [twilight 与 zen-mode](lua/one/plugins/zen.lua)
  - 笔记本: [zk](lua/one/plugins/zk.lua)
  - 实时命令: [live-command](https://github.com/smjonas/live-command.nvim)
  - 颜色着色: [ccc.nvim](lua/one/plugins/colors/ccc.lua) (默认) 或 [vim-hexokinase](lua/one/plugins/colors/hexokinase.lua) 或 [nvim-colorizer](lua/one/plugins/colors/colorizer.lua)
  - 翻译: [translate.nvim](lua/one/plugins/translate.lua)
  - [游戏](lua/one/plugins/funny.lua)
  - One.nvim 增强插件: [one](lua/one/plugins/one.lua)

  </details>


## 截图

<details open>
<summary>点击展开/折叠</summary>

### Dashboard

![dashboard.png](https://media.githubusercontent.com/media/adoyle-h/_imgs/master/github/one.nvim/dashboard.png)

### UI

![UI.png](https://media.githubusercontent.com/media/adoyle-h/_imgs/master/github/one.nvim/UI.png)

![UI-2.png](https://media.githubusercontent.com/media/adoyle-h/_imgs/master/github/one.nvim/UI-2.png)

### 大纲

![outline.png](https://media.githubusercontent.com/media/adoyle-h/_imgs/master/github/one.nvim/outline.png)

按 `<space>o` 打开大纲。

### 文件列表

![finder.png](https://media.githubusercontent.com/media/adoyle-h/_imgs/master/github/one.nvim/finder.png)

按 `<space>f` 打开文件列表。

### 快捷键列表

![keymaps.png](https://media.githubusercontent.com/media/adoyle-h/_imgs/master/github/one.nvim/keymaps.png)

按 `<space>k` 打开快捷键列表。

### 命令列表

![cmd-finder.png](https://media.githubusercontent.com/media/adoyle-h/_imgs/master/github/one.nvim/cmd-finder.png)

按 `<space>p` 打开命令列表。

### 诊断列表

![diagnostic.png](https://media.githubusercontent.com/media/adoyle-h/_imgs/master/github/one.nvim/diagnostic.png)

按 `<space>d` 或 `<space>D` 打开诊断列表。详见 [Diagnostic 快捷键](./doc/usage/keymaps.md#diagnostic)。

### 补全

![completion.png](https://media.githubusercontent.com/media/adoyle-h/_imgs/master/github/one.nvim/completion.png)

函数签名补全

![completion-function-args.png](https://media.githubusercontent.com/media/adoyle-h/_imgs/master/github/one.nvim/completion-function-args.png)

</details>

## [安装](./doc/install-and-init.zh.md)

## 更新

one.nvim, impatient.nvim 以及[插件管理器](#插件管理器)的源码不由插件管理器管理。
你可以使用 lua 函数或者命令来更新它们。

- 更新 one.nvim: `:OneUpdate one` 或 `:lua one.update('one')`
- 更新 impatient: `:OneUpdate impatient` 或 `:lua one.update('impatient')`
- 更新 pm: `:OneUpdate pm` 或 `:lua one.update('pm')`
- 更新所有: `:OneUpdate` 或 `:OneUpdate all` 或 `:lua one.update()`

## [常见问题](./doc/faq/README.md)

## 配置

```lua
require('one').setup {}
```

所有配置项都是可选的。你可以覆盖默认配置。
请看[用户配置](./doc/user-config.zh.md)。

## 插件管理器

选择你喜欢的插件管理器，目前提供 `lazy` (默认)，`vim-plug` 和 `packer`。

```lua
require('one').setup {
  config = {
    pluginManager = { use = 'packer' }, -- 'lazy' or 'vim-plug' or 'packer'
  },
}
```

|              | lazy                    | vim-plug                    | packer                                      |
|--------------|-------------------------|-----------------------------|---------------------------------------------|
| 插件目录     | {DATA_DIR}/lazy.nvim    | {DATA_DIR}/lazy.nvim        | {DATA_DIR}/site/pack/user/start/packer.nvim |
| 默认配置文件 | lua/one/config/lazy.lua | lua/one/config/vim-plug.lua | lua/one/config/packer.lua                   |

`{DATA_DIR}` 的值见 `:lua print(vim.fn.stdpath('data'))`。

当你从 vim-plug 或者 lazy 切换到 packer，就需要重装插件。详见[初始化](./doc/install-and-init.zh.md#初始化)流程。

## 插件

所有插件都可以被关闭，覆盖默认配置项，或者替换成你喜欢的插件。自定义配置和扩展非常方便。

插件的定义和使用，详见[./doc/plugin.md](./doc/plugin.md)。

你甚至可以设置 `onlyPlugins = {}` 来一键禁用所有插件（不禁用插件管理器）。详见 [Debug - Disable other plugins](./doc/usage/debug.md#disable-other-plugins)。

你可以调用 `:OneShowPlugins` 查看加载的和未加载的插件。

## 颜色和高亮

本项目高度依赖 [treesitter][]。如果语法高亮失效，检查你的 [treesitter parsers](https://github.com/nvim-treesitter/nvim-treesitter#language-parsers) 是否正常。
阅读 [./doc/treesitter.md](./doc/treesitter.md) 查看如何排查。

你可以修改默认配色和高亮。
阅读 [./doc/colors.md](./doc/colors.md) 查看更多细节。

### 色彩空间

本项目的颜色是根据 [Display P3](https://www.color.org/chardata/rgb/DisplayP3.xalter) 色彩空间设计的。对于 MacOS 系统和 iTerm2 用户友好。

如果你的 nvim 配色看起来跟下图有点不一样。你的终端应该不是处于 Display P3 色彩空间。
你可以尝试 [sRGB 配色](lua/one/colors/srgb.lua)。详见[颜色 - 色彩空间](./doc/colors.md#color-space)。

<img src="https://media.githubusercontent.com/media/adoyle-h/_imgs/master/github/one.nvim/colors.png" height="400px" />

什么是色彩空间？可参考[这篇文章](https://adoyle.me/Today-I-Learned/design/color-space.html)。

## 注意

`$VIMRUNTIME/filetype.vim` 不会被调用，文件类型设置请见 [./lua/one/plugins/filetype.lua](./lua/one/plugins/filetype.lua)。

其他注意事项见 [./doc/note.md](./doc/note.md)。

## [使用](./doc/usage/README.zh.md)

- [Debug](./doc/usage/debug.md)
- [快捷键](./doc/usage/keymaps.zh.md)
- [命令](./doc/usage/commands.md)
- [代码片段 (Snippets)](./doc/usage/snippet.md)
- [LSP](./doc/usage/README.zh.md#lsp)
- [代码格式化](./doc/usage/README.zh.md#代码格式化)
- [Telescope 插件](./doc/usage/README.zh.md#telescope-插件)
- [窗口选择器](./doc/usage/README.zh.md#窗口选择器)
- [浮动命令栏](./doc/usage/README.zh.md#浮动命令栏)
- [未加载的插件](./doc/usage/README.zh.md#未加载的插件)
- [扩展你自己的插件、高亮、命令等配置](./doc/usage/README.zh.md#扩展你自己的插件高亮命令等配置)
- [全局变量](./doc/usage/README.zh.md#全局变量)
- [代理](./doc/usage/proxy.zh.md)

## API

直接看[代码](./lua/one/init.lua)。

## 项目文件结构

```
.
├── doc/                     // Documents
├── lua/
│   └── one/
│       ├── async.lua        // async library
│       ├── config/          // Keymaps
│       │   ├── colors.lua   // Default color config
│       │   ├── default.lua  // Default config
│       │   ├── packer.lua   // packer.nvim default config
│       │   ├── symbol.lua   // symbols
│       │   └── vim-plug.lua // vim-plug default config
│       ├── config.lua       // Config loader
│       ├── consts.lua       // Constants
│       ├── filetype.lua     // FileType autocmd
│       ├── impatient.lua    // Cache lua modules
│       ├── one.lua          // The one singleton
│       ├── init.lua         // The lua required entry point
│       ├── plugins.lua      // Plugin loading list
│       ├── util.lua         // Utility functions
│       ├── util_spec.lua    // Unit test for util.lua
│       ├── keymap/          // Keymaps
│       ├── plugins/         // Available plugins written in lua
│       │   └── themes/      // Color schemas
│       └── plugin-manager/
│           ├── init.lua     // Plugin Manager
│           ├── lazy.lua     // Wrapper for lazy.nvim
│           ├── vim-plug.lua // Wrapper for vim-plug
│           └── packer.lua   // Wrapper for packer.nvim
└── scripts/                 // scripts for building project
```

## 启动时间

```lua
require('one').setup {
  plugins = {
    { 'profiling', disable = false }, -- 该插件默认禁用
  }
}
```

启动 [profiling](./lua/one/plugins/profiling.lua) 插件，nvim 启动后调用 `:StartupTime`。将会输出启动阶段的用时。

## 提建议，修 Bug，做贡献

**在创建新的 Issue/Discussion/PR，以及发表评论之前**，请先阅读 [./CONTRIBUTING.zh.md](./CONTRIBUTING.zh.md)。

## 版权声明

Copyright 2016-2023 ADoyle (adoyle.h@gmail.com). Some Rights Reserved.
The project is licensed under the **BSD 3-clause License**.

Read the [LICENSE][] file for the specific language governing permissions and limitations under the License.

Read the [NOTICE][] file distributed with this work for additional information regarding copyright ownership.

## 其他项目

我创建的[其他 nvim 项目](https://github.com/adoyle-h?tab=repositories&q=&type=source&language=lua&sort=stargazers)。


<!-- links -->

[LICENSE]: ./LICENSE
[NOTICE]: ./NOTICE
[packer.nvim]: https://github.com/wbthomason/packer.nvim
[impatient.nvim]: https://github.com/lewis6991/impatient.nvim
[treesitter]: https://github.com/nvim-treesitter/nvim-treesitter
[lazy.nvim]: https://github.com/folke/lazy.nvim

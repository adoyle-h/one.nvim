# One.nvim

用 Lua 编写的 Neovim 一体化配置框架。易配置，可扩展。

Click [./README.md](./README.md) to read English documents.

## 特性

- 用 Lua 管理 nvim 配置。所有配置项都可覆盖。
- 充分使用 Neovim 功能：Native LSP、Float Window、Winbar。
- 基于 [vim-plug](https://github.com/junegunn/vim-plug) 或 [packer](https://github.com/wbthomason/packer.nvim) 的插件框架，任你选择。详见[插件管理器](#插件管理器)。
- 帅气的界面和配色。暗黑模式。支持真彩色、平滑滚动、滚动条、Dashboard。你可以修改配色，详见 [doc/colors.md](doc/colors.md)。
- 可配置，详见[配置章节](#配置)。
- 支持配置 github 代理，在中国大陆可加快插件下载速度。详见[代理](#代理)。
- 集成了 120 多个 Vim/Nvim 插件。增强插件的使用体验，并且修复了一些插件的缺点。

  <details close>
  <summary>点击展开/折叠</summary>

  - 插件管理器: [vim-plug](lua/one/plugin-manager/vim-plug.lua) (默认) 或 [packer](lua/one/plugin-manager/packer.lua)
  - 面板: [alpha.nvim](lua/one/plugins/alpha.lua)
  - 大纲: [aerial](lua/one/plugins/aerial.lua) (默认) 或 [majutsushi/tagbar](lua/one/plugins/tagbar.lua)
  - 文件浏览器: [neo-tree](lua/one/plugins/neo-tree.lua) (默认) 或 [nerdtree](lua/one/plugins/nerdtree.lua) 或 [nvim-tree](lua/one/plugins/nvim-tree.lua)
  - 状态栏: [lualine](lua/one/plugins/lualine.lua) (默认) 或 [airline](lua/one/plugins/airline.lua)
  - Tab 栏: [tabby](lua/one/plugins/tabby.lua)
  - Buffer 栏: [barbar](lua/one/plugins/barbar.lua) 或 [bufferline](lua/one/plugins/bufferline.lua) (如果使用 Buffer 栏，你要禁用 Tab 栏插件)
  - 滚动条: [nvim-scrollbar](lua/one/plugins/scrollbar.lua)
  - 平滑滚动: [neoscroll.nvim](lua/one/plugins/scroll.lua)
  - 会话: [persisted](lua/one/plugins/session/persisted.lua) (默认) 或 [possession](lua/one/plugins/session/possession.lua) 或 [xolox/vim-session](lua/one/plugins/session/vim-session.lua) 或 [rmagatti/auto-session](lua/one/plugins/session/auto-session.lua)
  - 模糊查找: [telescope](lua/one/plugins/telescope/main.lua) 与 [ctrlsf](lua/one/plugins/search/ctrlsf.lua)
  - Diagnostics 窗口: [trouble](lua/one/plugins/trouble.lua)
  - 撤销: [vim-mundo](lua/one/plugins/undotree.lua)
  - 语法高亮: [treesitter](https://github.com/nvim-treesitter/nvim-treesitter) 与 [nvim-ts-rainbow](lua/one/plugins/treesitter/rainbow.lua) 与 [nvim-treesitter-pairs](lua/one/plugins/treesitter/pairs.lua)
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
  - 启动加速: [impatient.nvim](https://github.com/lewis6991/impatient.nvim)
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
  - 颜色着色: [nvim-colorizer](lua/one/plugins/colors/inline.lua)
  - [游戏](lua/one/plugins/funny.lua)

  </details>


## 截图

<details close>
<summary>点击展开/折叠</summary>

### Dashboard

![dashboard.png](https://media.githubusercontent.com/media/adoyle-h/_imgs/master/github/one.nvim/dashboard.png)

### UI

![UI.png](https://media.githubusercontent.com/media/adoyle-h/_imgs/master/github/one.nvim/UI.png)

### Outline

![outline.png](https://media.githubusercontent.com/media/adoyle-h/_imgs/master/github/one.nvim/outline.png)

### Finder

![finder.png](https://media.githubusercontent.com/media/adoyle-h/_imgs/master/github/one.nvim/finder.png)

### Keymaps

![keymaps.png](https://media.githubusercontent.com/media/adoyle-h/_imgs/master/github/one.nvim/keymaps.png)

### Diagnostic

![diagnostic.png](https://media.githubusercontent.com/media/adoyle-h/_imgs/master/github/one.nvim/diagnostic.png)

### Completion

![completion.png](https://media.githubusercontent.com/media/adoyle-h/_imgs/master/github/one.nvim/completion.png)

函数签名补全

![completion-function-args.png](https://media.githubusercontent.com/media/adoyle-h/_imgs/master/github/one.nvim/completion-function-args.png)

### Float Cmdline

该功能默认未开启，因为还不稳定。
你可以开启试用。

```lua
require('one').setup {
  plugins = {
    { 'noice', disable = false },
  },
}
```

![cmdline.png](https://media.githubusercontent.com/media/adoyle-h/_imgs/master/github/one.nvim/cmdline.png)

</details>

## 依赖

- [NVIM v0.8][] 及以上版本
- python3、pip3
- nvim python provider
  - `pip3 install --upgrade --user pynvim`
  - `pip2 install --upgrade --user pynvim` (这是可选的)
- Git 与 curl
- C 编译器与 libstdc++。([treesitter](https://github.com/nvim-treesitter/nvim-treesitter#requirements) 需要)
- [Nerd Font 字体][Nerd Font]。推荐 [DejaVuSansMonoForPowerline Nerd Font][font]。记得修改你的终端的字体设置。
- [ripgrep(rg)](https://github.com/BurntSushi/ripgrep)
- 支持 Linux 和 MacOS，不支持 Windows

## 安装

你有三种方式安装本项目。

1. 以插件的形式加载。
2. 使用容器，开箱即用。
3. 直接 Git clone 本项目。

### 插件形式加载

```sh
# 设置你的 nvim 目录
NVIM_HOME=${XDG_CONFIG_HOME:-$HOME/.config}/nvim
NVIM_DATA=${XDG_CONFIG_HOME:-$HOME/.local/share}/nvim
mkdir -p "$NVIM_DATA"/plugins
git clone --depth 1 --single-branch https://github.com/adoyle-h/one.nvim.git "$NVIM_DATA"/plugins/one

# 创建 init.lua 文件
cat <<EOF > "$NVIM_HOME"/init.lua
vim.opt.rtp:prepend { vim.fn.stdpath('data') .. '/plugins/one' }

require('one').setup {}
EOF
```

[初始化](#初始化)后，执行 `nvim` 启动。

### 开箱即用

```sh
# 在主机上缓存 nvim 数据
docker volume create nvim-data
# 建议把这行 alias 加到 ~/.bashrc
alias nvim='docker run --rm -it --platform linux/amd64 -v "nvim-data:/root/.local/share/nvim" -v "$PWD:/workspace" adoyle/neovim:v0.8.0'
```

[初始化](#初始化)后，执行 `nvim` 启动。

### 直接 git clone

```sh
# 设置你的 nvim 配置目录
NVIM_HOME=${XDG_CONFIG_HOME:-$HOME/.config}/nvim
git clone --depth 1 https://github.com/adoyle-h/one.nvim.git "$NVIM_HOME"
```
[初始化](#初始化)后，执行 `nvim` 启动。

## 初始化

- 用你现有的编辑器修改 `init.lua` 文件的配置。你可以参考[我的配置](./init.lua)。
  - `config.pluginManager.use` 选择你喜欢的插件管理器。详见[插件管理器](#插件管理器)章节。
  - 下载插件可能会比较慢。通过配置项 `config.proxy.github` 设置代理加速。详见[代理](#代理)。
- 打开 `nvim`。它会自动下载所需依赖包，比如 impatient.nvim, vim-plug 或 packer。然后自动下载插件。
- 如果下载插件失败。
  - 当 `config.pluginManager.use = vim-plug`。
    - 在 nvim 执行 `:PlugInstall` 安装所有插件，重复直到全部安装成功。
    - 插件默认安装在 `~/.local/share/nvim/plugins`。你可以通过配置项 `CM.config.pluginManager['vim-plug'].pluginDir` 修改插件目录。
  - 当 `config.pluginManager.use = packer`
    - 在 nvim 执行 `:PackerSync` 安装所有插件，重复直到全部安装成功。
    - 插件默认安装在 `~/.local/share/nvim/pack/packer`。**不要修改** `config.pluginManager.packer.package_root`，除非你十分明白自己在做什么。如果你修改后出了错，请不要来询问我。
- nvim 启动后会自动下载 treesitter parsers。它们定义在 `config.treesitter.ensure_installed` 和 `config.treesitter.ignore_install`。
  - 如果安装失败，重启 nvim 或执行 `:TSInstall all` 来重装。
- nvim 启动后会自动下载 LSP/DAP/Formatter/Linter，它们定义在 `config['mason-installer'].ensureInstalled`.
  - 如果安装失败，重启 nvim 或执行 `:MasonToolsInstall` 来重装。
  - 也可以按 `<M-m>` 打开 Mason 窗口，选择要安装的 LSP/DAP/Formatter/Linter。

## 配置

所有配置项都是可选的。

```lua
require('one').setup {}
```

### 用户配置

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

你可参考[我的 ./init.lua](./init.lua) 来编写你的配置。

你可以覆盖插件的默认选项。详见 [插件 - ](./doc/plugin.zh)。

### 默认配置

部分默认配置写在 [./lua/one/config/default.lua](./lua/one/config/default.lua)，部分写在插件的 `defaultConfig` 里。

部分默认颜色配置写在 [./lua/one/config/color.lua](./lua/one/config/color.lua) 与 [./lua/one/themes/onedarkpro.lua](./lua/one/themes/onedarkpro.lua)，另一部分写在插件的 `highlights` 参数里。

### configFn(config)

有些插件配置需要用到对应的模块。例如 `null-ls` 的 `sources` 配置项。你必须定义在 `configFn(config)` 函数。
函数的返回值必须是一个 table，它会被合并到 `config` 变量。

```lua
require('one').setup {
  configFn = function(config)
    local builtins = require('null-ls').builtins
    local codeActions = builtins.code_actions
    local diagnostics = builtins.diagnostics
    local formatting = builtins.formatting

    -- Do not return config, only return the overrided parts
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

### 覆盖插件参数

通过 `require('one').setup {plugins = {}}`，你可以覆盖任何[插件参数](./doc/plugin.zh.md#插件参数)。你可以覆盖配色和快捷键设置。

### 查看配置

你可以通过编写 lua 脚本访问 `require('one.config').config` 或 `a.CM.config` 获取配置信息.

同时，这里提供了两个命令来查看配置：
`:ShowConfig` 查看最终合并的配置。
`:ShowPlugins` 查看加载的和未加载的插件。

因为使用了 [inspect.lua](https://github.com/kikito/inspect.lua) 打印配置，
会有例如 `<table id>` 这样的标记。这是为了避免重复，对于 `<table 28>` 搜索文件内对应的 `--[[<table 28>--]]` 即可找到相应的值。
`<table id>`, `<function id>`, `<metatable>` 等标记的解释详见 [inspect.lua](https://github.com/kikito/inspect.lua#examples-of-use)。

### 插件管理器

选择你喜欢的插件管理器，目前提供 `vim-plug` (默认) 和 `packer`。

```lua
require('one').setup {
  config = {
    pluginManager = { use = 'packer' }, -- 'vim-plug' or 'packer'
  },
}
```

vim-plug 管理的插件目录和 packer 管理的是不一样的。当你改变了 `config.pluginManager.use` 的值，需要重装插件。详见[初始化](#初始化)流程。

- Packer [默认配置](./lua/one/config/packer.lua)
- Vim-Plug [默认配置](./lua/one/config/vim-plug.lua)

### [插件](./doc/plugin.zh.md)

### [颜色和高亮](./doc/colors.md)

### 代理

```lua
require('one').setup {
  config = {
    proxy = {
      -- 如果你在中国大陆，推荐使用 'https://ghproxy.com'。否则，不要设置该配置项。
      github = 'https://ghproxy.com',
    },
  },
}
```

有些插件使用了 git submodule，代理无法起作用。建议你执行 `git config --global http.https://github.com.proxy https://ghproxy.com` 设置全局代理。

## 注意

`$VIMRUNTIME/filetype.vim` 不会被调用，文件类型设置请见 [./lua/plugins/filetype.lua](./lua/plugins/filetype.lua)。

## 使用

### [Debug](./doc/debug.md)

Debug 技巧。例如禁用所有插件。

### 快捷键

[./doc/keymaps.md](./doc/keymaps.md) 文档记录了常用的快捷键。

在 nvim 按下 `<space>k` 查询所有快捷键。

### [命令](./doc/commands.md)

### [代码片段](./doc/snippet.md)

### LSP

本项目使用 [nvim-lspconfig][] 和 [null-ls][] 来配置 LSP，管理 LSP 与 Nvim 的连接。
使用 [mason.nvim][] 来安装与管理 lsp，dap 和 null-ls 的第三方包。

- 执行 `:Mason` 或者按 `<Alt-m>` 查看 LSP 安装情况。
- 执行 `:LspInfo` 查看当前文件使用的 LSP。
- 执行 `:NullLsInfo` 查看当前文件使用的 LSP。

[nvim-lspconfig][] 封装了一系列 LSP 客户端配置，能够开箱即用。它提供灵活的配置项便于用户自定义，详见[官方文档](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)。

[null-ls][] 是一个虚拟 LSP 客户端，可以将 eslint、prettier 这类非 LSP 的普通命令行转化为 LSP。
它提供统一灵活的配置项便于用户自定义，详见 [null-ls 官方配置文档](https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTIN_CONFIG.md)。

本项目框架配置默认只安装了 Lua LSP 和 Formatter。本项目配置安装了一系列 LSP。用户可以参考 [config/lsp](./lua/one/config/lsp.lua) 和 [init.lua](./init.lua) 来定制自己的。

### 格代化码式

本项目基于 LSP 来格式化代码。
使用 `lsp-format` 代替 nvim 内置的 `vim.lsp.buf.format`，提供更灵活的自定义配置。详见 [lsp-format 选项](https://github.com/lukas-reineke/lsp-format.nvim#special-format-options)。

你可以指定多个 Formatter 同时格式化代码。你也可以根据 filetype 调整 Formatter 的调用顺序。

Formatter 配置在 `lsp.format` 与 `nullLS.sources`。
默认先使用定义在 `nullLS.sources` 的 Formatter，后使用定义在 `lsp.format` 的 Formatter。Formatter 执行顺序按定义顺序.

### Telescope 插件

本项目定义了很多有用的 Telescope 插件，详见 [./lua/one/plugins/telescope/extensions.lua](./lua/one/plugins/telescope/extensions.lua)。

可使用 `<space>;` 快捷键查询所有 Telescope 插件。

## API

直接看[代码](./lua/one/init.lua)。

## 项目文件结构

```
.
├── doc/                     // Documents
├── lua/
│   └── one/
│       ├── config/          // Keymaps
│       │   ├── color.lua    // Default color config
│       │   └── default.lua  // Default config
│       ├── config.lua       // Config loader
│       ├── consts.lua       // Constants
│       ├── filetype.lua     // FileType autocmd
│       ├── framework.lua    // The framework singleton
│       ├── init.lua         // The lua required entry point (plugin way)
│       ├── plugins.lua      // Plugin loading list
│       ├── util.lua         // Utility functions
│       ├── util_spec.lua    // Unit test for util.lua
│       ├── keymap/          // Keymaps
│       ├── plugins/         // Available plugins written in lua
│       │   └── themes/      // Color schemas
│       └── plugin-manager/
│           ├── init.lua     // Plugin Manager
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

启动 [profiling](./lua/plugins/profiling.lua) 插件，nvim 启动后调用 `:StartupTime`。将会输出启动阶段的用时。

## 建议，Bug，做贡献

欢迎提供任何建议或者意见。请开 [issue][] 与我联系。

如果你想要提交一个新功能，请先开一个 Feature Request [issue][] 来讨论你的设计。

如果你想要提交一个 bug 修复，先查找相关 issue，再提交 Pull Request。

请阅读[如何为本项目贡献](./doc/contribution.md)

## 版权声明

Copyright 2016-2022 ADoyle (adoyle.h@gmail.com) All Rights Reserved. The project is licensed under the **BSD 3-clause License**.

See the [LICENSE][] file for the specific language governing permissions and limitations under the License.

## 其他项目

我创建的[其他 nvim 项目](https://github.com/adoyle-h?tab=repositories&q=&type=source&language=lua&sort=stargazers)。

<!-- links -->

[LICENSE]: ./LICENSE
[NOTICE]: ./NOTICE
[tags]: https://github.com/adoyle-h/one.nvim/tags
[issue]: https://github.com/adoyle-h/one.nvim/issues
[font]: https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/DejaVuSansMono
[Nerd Font]: https://github.com/ryanoasis/nerd-fonts
[default-config]: ./lua/one/config/default.lua
[mason.nvim]: https://github.com/williamboman/mason.nvim
[null-ls]: https://github.com/jose-elias-alvarez/null-ls.nvim
[nvim-lspconfig]: https://github.com/neovim/nvim-lspconfig
[NVIM v0.8]: https://github.com/neovim/neovim/releases/tag/v0.8.0

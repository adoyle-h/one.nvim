# One.nvim

用 Lua 编写的 Neovim 一体化配置框架。易配置，可扩展。

Click [./README.md](./README.md) to read English documents.

## 特性

- 用 Lua 管理 nvim 配置。所有配置项都可覆盖。详见[配置章节](#配置)。
- 充分使用 Neovim 功能：Native LSP、Float Window、Winbar。
- 基于 [vim-plug](https://github.com/junegunn/vim-plug) 或 [packer.nvim][] 的插件框架，任你选择。详见[插件管理器](#插件管理器)。
- 帅气的界面和配色。暗黑模式。支持真彩色、平滑滚动、滚动条、Dashboard。你可以修改任意配色。详见 [颜色和高亮](#颜色和高亮)。
- 支持配置 github 代理，在中国大陆可加快插件下载速度。详见[代理](#代理)。
- 集成了 120 多个 Vim/Nvim 插件。增强插件的使用体验，并且修复了一些插件的缺点。

  <details close>
  <summary>点击展开/折叠插件列表</summary>

  - 插件管理器: [vim-plug](lua/one/plugin-manager/vim-plug.lua) (默认) 或 [packer](lua/one/plugin-manager/packer.lua)
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

你可使用 git clone 安装本项目。或在容器中运行 nvim。

### git clone

```sh
PACK_DIR=${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/pack/user/start
mkdir -p "$PACK_DIR"
git clone --depth 1 --single-branch https://github.com/adoyle-h/one.nvim.git "$PACK_DIR"/one.nvim

# Set your nvim config directory
NVIM_HOME=${XDG_CONFIG_HOME:-$HOME/.config}/nvim
mkdir -p "$NVIM_HOME"
echo "require('one').setup {}" > "$NVIM_HOME"/init.lua
```

[初始化](#初始化)后，执行 `nvim` 启动。

### 容器

你可以在容器里运行它。这要求你的主机已安装 docker。

#### 构建容器

执行 `./scripts/build-container`。
（建议中国地区用户加上 `-p` 参数使用代理，加快构建速度）。

**苹果芯片的 Mac 用户注意**。当前 nvim 未提供 Arm 架构下的发行版。所以容器构建和运行都使用了 `--platform=linux/amd64` 选项。苹果芯片下运行容器会很卡。

#### 使用容器

```sh
# 在主机上缓存 nvim 数据
docker volume create nvim-data
# 建议把这行 alias 加到 ~/.bashrc
alias nvim='docker run --rm -it --platform linux/amd64 -v "$HOME/.config/nvim:/root/.config/nvim" -v "nvim-data:/root/.local/share/nvim" -v "$PWD:/workspace" adoyle/one.nvim:v0.8.0'
```

[初始化](#初始化)后，执行 `nvim` 启动。

## 初始化

- 用你现有的编辑器修改 `init.lua` 文件的配置。你可以参考[我的 init.lua][init.lua]。
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
    - 在 [packer.nvim][] 和 [impatient.nvim][] 提供的两种缓存机制作用下，你可能会遇到古怪的错误。尝试 `:lua one.reset()` 来清空所有插件和缓存文件。
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

你可参考[我的 init.lua][init.lua] 来编写你的配置。

你可以覆盖插件的默认选项。详见 [插件 - 使用插件](./doc/plugin.zh.md#使用插件)。

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

### 插件

所有插件都可以被关闭，覆盖默认配置项，或者替换成你喜欢的插件。自定义配置和扩展非常方便。

插件的定义和使用，详见[./doc/plugin.md](./doc/plugin.md)。

你甚至可以设置 `onlyPlugins = {}` 来一键禁用所有插件（不禁用插件管理器）。详见 [Debug - Disable other plugins](./doc/debug.md#disable-other-plugins)。

### 颜色和高亮

本项目高度依赖 [treesitter][]。如果语法高亮失效，检查你的 [treesitter parsers](https://github.com/nvim-treesitter/nvim-treesitter#language-parsers) 是否正常。
阅读 [./doc/treesitter.md](./doc/treesitter.md) 查看如何排查。

你可以修改默认配色和高亮。
阅读 [./doc/colors.md](./doc/colors.md) 查看更多细节。

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

`$VIMRUNTIME/filetype.vim` 不会被调用，文件类型设置请见 [./lua/one/plugins/filetype.lua](./lua/one/plugins/filetype.lua)。

其他注意事项见 [./doc/note.md](./doc/note.md)。

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

本项目实现了很多有用的 Telescope 插件，详见 [ad-telescope-extensions.nvim](https://github.com/adoyle-h/ad-telescope-extensions.nvim) 和 [./lua/one/plugins/telescope/extensions.lua](./lua/one/plugins/telescope/extensions.lua)。

可使用 `<space>;` 快捷键查询所有 Telescope 插件。

### 窗口选择器

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

### 未加载的插件

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

未加载的插件列表[在这](./doc/available-but-not-loaded-plugins.md)。

### 扩展你自己的插件、高亮、命令等配置

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

### 全局变量

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

欢迎提供任何建议或者意见。

**在开 issue/discussion/PR 之前，你必须先搜索相关 [issue][]/[discussion][]/[PR][]**，避免创建重复的链接。

- 请求新功能。请开一个 [discussion][]，简短且清晰地描述你的需求。
- 提交新功能。请开一个 [PR][]，简短且清晰地描述你的需求和设计。
- 报告 BUG。请开一个 [issue][]，简短且清晰地描述你发现的问题。
- 修复 BUG。请开一个 [PR][]，简短且清晰地描述你修了什么。
- 提问和建议。请开一个 [discussion][]。
- 其他上面未提到的内容，请开一个 [discussion][] 来讨论。

不要发重复或无用的内容，比如 `+1`，`哈哈`。请贴 emoji 标签反馈到评论上。

你可以使用中文反馈意见。但希望你尽可能使用英文，不要中英文混杂，而是写下完整的英文语句。
因为我们处于国际社区，英文更通用，方便外国人阅读理解你的意见。

请阅读[如何为本项目贡献](./doc/contribution.md)。

## 版权声明

Copyright 2016-2022 ADoyle (adoyle.h@gmail.com) Some Rights Reserved. The project is licensed under the **BSD 3-clause License**.

See the [LICENSE][] file for the specific language governing permissions and limitations under the License.

## 其他项目

我创建的[其他 nvim 项目](https://github.com/adoyle-h?tab=repositories&q=&type=source&language=lua&sort=stargazers)。

<!-- links -->

[LICENSE]: ./LICENSE
[NOTICE]: ./NOTICE
[tags]: https://github.com/adoyle-h/one.nvim/tags
[issue]: https://github.com/adoyle-h/one.nvim/issues
[discussion]: https://github.com/adoyle-h/one.nvim/discussions
[PR]: https://github.com/adoyle-h/one.nvim/pulls
[font]: https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/DejaVuSansMono
[Nerd Font]: https://github.com/ryanoasis/nerd-fonts
[default-config]: ./lua/one/config/default.lua
[mason.nvim]: https://github.com/williamboman/mason.nvim
[null-ls]: https://github.com/jose-elias-alvarez/null-ls.nvim
[nvim-lspconfig]: https://github.com/neovim/nvim-lspconfig
[NVIM v0.8]: https://github.com/neovim/neovim/releases/tag/v0.8.0
[init.lua]: https://github.com/adoyle-h/neovim-config/blob/master/init.lua
[packer.nvim]: https://github.com/wbthomason/packer.nvim
[impatient.nvim]: https://github.com/lewis6991/impatient.nvim
[treesitter]: https://github.com/nvim-treesitter/nvim-treesitter

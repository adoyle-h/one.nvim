# One.nvim

All-in-one neovim configuration framework implemented with Lua. It is high flexible to be customized and extended.

中文文档 [./README.zh.md](./README.zh.md)

## Features

- All in Lua. All configs can be overrided.
- Use many Neovim features: Native LSP, Float Window, Winbar.
- Lua-wrapped plugin manager based on [vim-plug](https://github.com/junegunn/vim-plug) or [packer](https://github.com/wbthomason/packer.nvim) at your choice. See [Plugin Manager](#plugin-manager).
- Awesome UI and color schema. Dark Mode. Support True-Color, Smooth-Scroll, Scrollbar, Dashboard. You can change colors and highlights. See [doc/colors.md](doc/colors.md).
- [Configurable](#configuration).
- Configurable proxy for fast git download in China Mainland. See [Proxy](#proxy).
- Integrated 120+ powerful Vim/Nvim plugins. Enhancing the usage experience, and fixed some shortcomings of these plugins.

  <details close>
  <summary>Click to expend/collapse</summary>

  - Plugin Manager: [vim-plug](lua/one/plugin-manager/vim-plug.lua) (default) or [packer](lua/one/plugin-manager/packer.lua)
  - Dashboard: [alpha.nvim](lua/one/plugins/alpha.lua)
  - Outline: [aerial](lua/one/plugins/aerial.lua) (default) or [majutsushi/tagbar](lua/one/plugins/tagbar.lua)
  - File Explorer: [neo-tree](lua/one/plugins/neo-tree.lua) (default) or [nerdtree](lua/one/plugins/nerdtree.lua) or [nvim-tree](lua/one/plugins/nvim-tree.lua)
  - Statusline: [lualine](lua/one/plugins/lualine.lua) (default) or [airline](lua/one/plugins/airline.lua)
  - Tabline: [tabby](lua/one/plugins/tabby.lua)
  - Bufferline: [barbar](lua/one/plugins/barbar.lua) or [bufferline](lua/one/plugins/bufferline.lua) (If use bufferline, you should disable tabline plugin)
  - Cursorline Highlight: [beacon](lua/one/plugins/beacon.lua) (default) or [specs.nvim](lua/one/plugins/specs.lua)
  - Scrollbar: [nvim-scrollbar](lua/one/plugins/scrollbar.lua)
  - Smooth-Scroll: [neoscroll.nvim](lua/one/plugins/scroll.lua)
  - Session: [persisted](lua/one/plugins/session/persisted.lua) (default) or [possession](lua/one/plugins/session/possession.lua) or [xolox/vim-session](lua/one/plugins/session/vim-session.lua) or [rmagatti/auto-session](lua/one/plugins/session/auto-session.lua)
  - Fuzzy Finding: [telescope](lua/one/plugins/telescope/main.lua) and [ctrlsf](lua/one/plugins/search/ctrlsf.lua)
  - Diagnostics Window: [trouble](lua/one/plugins/trouble.lua)
  - Undo: [vim-mundo](lua/one/plugins/undotree.lua)
  - Syntax Highlight: [treesitter](https://github.com/nvim-treesitter/nvim-treesitter) and [nvim-ts-rainbow](lua/one/plugins/treesitter/rainbow.lua) and [nvim-treesitter-pairs](lua/one/plugins/treesitter/pairs.lua)
  - Highlight Words: [vim-interestingwords](lua/one/plugins/highlight-words.lua)
  - Code Comment: [Comment.nvim](lua/one/plugins/comment.lua) (default) or [nerdcommenter](lua/one/plugins/comment_nerd.lua)
  - LSP: [nvim-lspconfig](lua/one/plugins/lsp/main.lua) and [treesitter](lua/one/plugins/treesitter/init.lua) and [null-ls](lua/one/plugins/lsp/null-ls.lua) and [nlsp](lua/one/plugins/lsp/nlsp.lua) and [goto-preview](lua/one/plugins/lsp/preview.lua) and [lsp-toggle](https://github.com/adoyle-h/lsp-toggle.nvim)
  - DAP: [nvim-dap](lua/one/plugins/dap/init.lua)
  - Format: [lsp-format](lua/one/plugins/lsp/format.lua) and [editorconfig-vim](https://github.com/editorconfig/editorconfig-vim)
  - Formatter, Linter, LSP, DAP Manager: [mason](lua/one/plugins/lsp/mason.lua) and [mason-installer](lua/one/plugins/lsp/mason-installer.lua)
  - Completion: [nvim-cmp](lua/one/plugins/completion/init.lua)
  - Snippets: [nvim-snippy](lua/one/plugins/completion/snippet.lua)
  - Markdown: [plasticboy/vim-markdown](lua/one/plugins/markdown/main.lua) and [markdown-preview](lua/one/plugins/markdown/preview.lua) and [headlines.nvim](lua/one/plugins/markdown/headlines.lua) and [vim-MarkdownTOC](lua/one/plugins/markdown/toc.lua)
  - Surrounds: [nvim-surround](lua/one/plugins/match/surround.lua) and [nvim-autopairs](lua/one/plugins/match/autopairs.lua) and [nvim-ts-autotag](lua/one/plugins/match/ts-autotag.lua) and [vim-matchup](lua/one/plugins/match/matchup.lua)
  - Git: [gitsigns](lua/one/plugins/git/sign.lua) and [lazygit](lua/one/plugins/git/lazygit.lua) and [diffview.nvim](https://github.com/sindrets/diffview.nvim)
  - Indent Line: [indent-blankline](lua/one/plugins/indent-line.lua)
  - Cursor Move: [hop.nvim](lua/one/plugins/move/jump.lua) and [accelerated-jk](lua/one/plugins/move/accelerated.lua)
  - Window Picker: [nvim-window-picker](lua/one/plugins/move/window-picker.lua) (default) or [yorickpeterse/nvim-window](lua/one/plugins/move/window-selector.lua) or [vim-choosewin](lua/one/plugins/move/choose-window.lua)
  - Window Resize: [simeji/winresizer](lua/one/plugins/window/resize.lua) and [windows.nvim](lua/one/plugins/window/maximize.lua)
  - Context: [aerial](lua/one/plugins/aerial.lua) (default) or [navic](lua/one/plugins/navic.lua) and [nvim-treesitter-context](lua/one/plugins/treesitter/context.lua)
  - Text Align: [vim-easy-align](lua/one/plugins/align.lua)
  - Bookmark: [vim-bookmarks](lua/one/plugins/bookmark.lua)
  - Mark: [marks.nvim](lua/one/plugins/mark.lua)
  - Calendar: [mattn/calendar-vim](lua/one/plugins/calendar.lua)
  - Curl: [rest.nvim](lua/one/plugins/curl.lua)
  - Icons: [devicons](lua/one/plugins/devicons.lua) and [icon-picker](lua/one/plugins/icon-picker.lua)
  - UI Enhancing: [dressing](lua/one/plugins/dressing.lua) and [noice](lua/one/plugins/noice.lua)
  - Start Speed Up: [impatient.nvim](https://github.com/lewis6991/impatient.nvim)
  - Escape: [better-escape.nvim](lua/one/plugins/escape.lua)
  - Increment: [increment-activator](lua/one/plugins/increment.lua)
  - Filetype: [filetype.nvim](lua/one/plugins/filetype.lua)
  - Latex: [nabla](lua/one/plugins/latex.lua)
  - Notification: [notify](lua/one/plugins/notify.lua) (default) or [notifier](lua/one/plugins/notifier.lua)
  - Profiling: [vim-startuptime](lua/one/plugins/profiling.lua)
  - Text-Objects: [wildfire](lua/one/plugins/select.lua) and [nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects)
  - Table Edit: [vim-table-mode](lua/one/plugins/table.lua)
  - Terminal: [neoterm](lua/one/plugins/terminal/neoterm.lua)
  - Testing: [nvim-test](lua/one/plugins/test.lua)
  - TODO Comment: [todo-comments](lua/one/plugins/todo.lua)
  - Trailing Spaces: [whitespace](lua/one/plugins/trailing.lua)
  - Yank: [yanky](lua/one/plugins/yank.lua)
  - Zen Mode: [twilight and zen-mode](lua/one/plugins/zen.lua)
  - Notebook: [zk](lua/one/plugins/zk.lua)
  - Live Command: [live-command](https://github.com/smjonas/live-command.nvim)
  - Color Highlighter: [nvim-colorizer](lua/one/plugins/colors/inline.lua)
  - [Games](lua/one/plugins/funny.lua)

  </details>

## Screenshots

<details close>
<summary>Click to expend/collapse</summary>

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

Function signature completion

![completion-function-args.png](https://media.githubusercontent.com/media/adoyle-h/_imgs/master/github/one.nvim/completion-function-args.png)

</details>

## Dependencies

- [NVIM v0.8][] or later
- python3、pip3
- nvim python provider
  - `pip3 install --upgrade --user pynvim`
  - `pip2 install --upgrade --user pynvim` (it is optional)
- Git and curl
- A C compiler in your path and libstdc++ installed. (Required by [treesitter](https://github.com/nvim-treesitter/nvim-treesitter#requirements))
- [Nerd Font][]. Recommend [DejaVuSansMonoForPowerline Nerd Font][font]. Remember to change your terminal font setting.
- [ripgrep(rg)](https://github.com/BurntSushi/ripgrep)
- Linux and MacOS are supported. Windows not.

## Installation

You can use git clone to install. Or run nvim in container.

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

Do [initialization](#initialization) and then press `nvim` to get started.

### Container

You can use it in container.

```sh
# Cache the nvim data in host
docker volume create nvim-data
# It's recommended to add this line to ~/.bashrc
alias nvim='docker run --rm -it --platform linux/amd64 -v "$HOME/.config/nvim:/root/.config/nvim" -v "nvim-data:/root/.local/share/nvim" -v "$PWD:/workspace" adoyle/one.nvim:v0.8.0'
```

Do [initialization](#initialization) and then press `nvim` to get started.

## Initialization

- Use your current editor to edit config in file `init.lua`. You can refer to [my init.lua][init.lua].
  - `config.pluginManager.use` choose your favorite plugin manager. See [Plugin Manager](#plugin-manager) for details.
  - It maybe be slow to download plugins. Modify `config.proxy.github` option to use proxy. See [Proxy](#proxy) for details.
- Open `nvim`. It will auto download dependent packages, like impatient.nvim, vim-plug or packer. And then auto download plugins.
- When plugins installed failed.
  - If `config.pluginManager.use = vim-plug`
    - Run `:PlugInstall` in nvim, to install all plugins. Repeat it util all plugins installed successfully.
    - All plugines installed in `~/.local/share/nvim/plugins`. You can modify the plugin directory with the `CM.config.pluginManager['vim-plug'].pluginDir` option.
  - If `config.pluginManager.use = packer`
    - Run `:PackerSync` in nvim, to install all plugins. Repeat it util all plugins installed successfully.
    - All plugines installed in `~/.local/share/nvim/pack/packer`. **DO NOT MODIFY** the `config.pluginManager.packer.package_root` option, unless you completely know what you are doing. If the option modified and get any error, please don't ask me anything.
- It will auto download treesitter parsers, which defined in `config.treesitter.ensure_installed` and `config.treesitter.ignore_install`.
  - If failed, restart nvim or run `:TSInstall all` to install them.
- It will auto download LSP/DAP/Formatter/Linter, which defined in `config['mason-installer'].ensureInstalled`.
  - If failed, restart nvim or run `:MasonToolsInstall` to install them.
  - Or press `<M-m>` to open Mason window to choose LSP/DAP/Formatter/Linter.

## Configuration

All config options are optional.

```lua
require('one').setup {}
```

### User Config

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

You can override the default options of plugins. See [Plugin - Using Plugin](./doc/plugin.md#using-plugin).


### Default Config

Parts of default config written in [./lua/one/config/default.lua](./lua/one/config/default.lua), and other parts written in `defaultConfig` option of each plugin.

Parts of default highlights written in [./lua/one/config/color.lua](./lua/one/config/color.lua) and [./lua/one/themes/onedarkpro.lua](./lua/one/themes/onedarkpro.lua), and other parts written in `highlights` option of each plugin.

### configFn(config)

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

### Override Plugin Options

You can override any [plugin options](./doc/plugin.md#plugin-options) in `require('one').setup {plugins = {}}`. You can override highlights and keymaps.

### View Config

You can get config via `require('one.config').config` or `a.CM.config` in lua.

Also, there are two commands to view configs.
`:ShowConfig` to view final merged config.
`:ShowPlugins` to view disabled and enabled plugins.

Because using [inspect.lua](https://github.com/kikito/inspect.lua) to print configuration,
you may see tags such as `<table id>`. It is for preventing infinite loops.
You can search `--[[<table 28>--]]` to view its value for `<table 28>` in same buffer content.

For `<table id>`, `<function id>`, `<metatable>` tag explanations, see [inspect.lua](https://github.com/kikito/inspect.lua#examples-of-use).

### Plugin Manager

Choose your favorite plugin manager. Now available: `vim-plug` (default) and `packer`.

```lua
require('one').setup {
  config = {
    pluginManager = { use = 'packer' }, -- 'vim-plug' or 'packer'
  },
}
```

The plugins directory maneged by vim-plug is different from packer. When you modify `config.pluginManager.use`, the plugins need to be installed again. See [initialization](#initialization).

- Packer [default config](./lua/one/config/packer.lua)
- Vim-Plug [default config](./lua/one/config/vim-plug.lua)

### Plugin

Read [./doc/plugin.md](./doc/plugin.md) for plugin definitions and references.

### [Colors and Highlights](./doc/colors.md)

### Proxy

```lua
require('one').setup {
  config = {
    proxy = {
      -- If you are in China Mainland, it is suggested to set 'https://ghproxy.com'. Otherwise, remove this option.
      github = 'https://ghproxy.com',
    },
  },
}
```

Proxy will not work for some plugins using "git submodule". It's recommended to execute `git config --global http.https://github.com.proxy https://ghproxy.com` to set global git proxy.

## Notice

`$VIMRUNTIME/filetype.vim` won't be loaded. Filetype detected in [./lua/plugins/filetype.lua](./lua/plugins/filetype.lua)。

## Usage

### [Debug](./doc/debug.md)

Tricks for debug. Such as disable all plugins.

### Keymaps

For basic intro, see [./doc/keymaps.md](./doc/keymaps.md).

Press `<space>k` to see all keymaps in nvim.

### [Commands](./doc/commands.md)

### [Snippets](./doc/snippet.md)

### LSP

Using [nvim-lspconfig][] and [null-ls][] to manage LSP. And using [mason.nvim][] to manege lsp, dap and null-ls packages.

- Call `:Mason` or press `<Alt-m>` to view LSP installations.
- Call `:LspInfo` to show LSP for current file.
- Call `:NullLsInfo` to show LSP for current file.

### Code Format

The code formatting is based on LSP. Using `lsp-format` instead of nvim builtin `vim.lsp.buf.format` to provide more flexible configurations. See [lsp-format options](https://github.com/lukas-reineke/lsp-format.nvim#special-format-options).

You can set multi formatters to format codes at the same time. And you can also change the order of formatters by filetype.

The configs of formatter are at `lsp.format` and `nullLS.sources`.
Default to use the formatters defined in `nullLS.sources`, and then formatters defined in `lsp.format`.

### Telescope Extensions

There are many useful telescope extensions. See [ad-telescope-extensions.nvim](https://github.com/adoyle-h/ad-telescope-extensions.nvim) and [./lua/one/plugins/telescope/extensions.lua](./lua/one/plugins/telescope/extensions.lua)

Use `<space>;` to view all telescope extensions.

### Window Picker

![window-picker.png](https://media.githubusercontent.com/media/adoyle-h/_imgs/master/github/one.nvim/window-picker.png)

Press `<C-w><C-w>` to open a picker to view all tabpages and windows.
Press `<CR>` to goto selected window or tabpage.

### Float Cmdline

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

### Not-Loaded Plugins By Default

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

The not-loaded plugins list in [here](./doc/available-but-not-loaded-plugins.md).

### Extend your plugins/highlights/commands and so on

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

## API

Just read [codes](./lua/one/init.lua).

## Project File Structure

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
│       ├── one.lua          // The one singleton
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

## Startup Time

```lua
require('one').setup {
  plugins = {
    { 'profiling', disable = false }, -- This plugin is disabled in default
  }
}
```

Enable [profiling](./lua/plugins/profiling.lua) plugin, and invoke `:StartupTime` in nvim. It will print each time on startup.

## Suggestion, Bug Reporting, Contributing

Any comments and suggestions are always welcome. Please open an [issue][] to contact with me.

If you want to submit a new feature, please open an [issue][] for feature request to talk about your design.

If you want to submit a bug fix, search related issues first, and then open a Pull Requst.

And read [how to contribute](./doc/contribution.md).

## Versions

See [tags][].
The versions follows the rules of [SemVer 2.0.0](http://semver.org/).

## Copyright and License

Copyright 2016-2022 ADoyle (adoyle.h@gmail.com) All Rights Reserved. The project is licensed under the **BSD 3-clause License**.

See the [LICENSE][] file for the specific language governing permissions and limitations under the License.

See the [NOTICE][] file distributed with this work for additional information regarding copyright ownership.

## Other Projects

[Other nvim projects](https://github.com/adoyle-h?tab=repositories&q=&type=source&language=lua&sort=stargazers) created by me.

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
[init.lua]: https://github.com/adoyle-h/neovim-config/blob/master/init.lua

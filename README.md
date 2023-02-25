# One.nvim

All-in-one neovim configuration framework implemented with Lua. It is highly flexible to be customized and extended.

[English](./README.md) | [中文](./README.zh.md)

## Features

- All in Lua. All configs can be overridden. Read [Configuration](#configuration).
- Use many Neovim features: Native LSP, Float Window, Winbar.
- The supported plugin managers: [lazy.nvim][], [vim-plug](https://github.com/junegunn/vim-plug) and [packer.nvim][]. Read [Plugin Manager](#plugin-manager).
- Awesome UI and color schema. Dark Mode. Support True-Color, Smooth-Scroll, Scrollbar, Dashboard. You can change colors and highlights. Read [Colors and Highlights](#colors-and-highlights).
- Configurable proxy for fast git download in China Mainland. Read [Proxy](./doc/usage/proxy.md).
- Integrated 120+ powerful Vim/Nvim plugins. Enhancing the usage experience, and fixed some shortcomings of these plugins.

  <details close>
  <summary>Click to expend/collapse plugin list</summary>

  - Plugin Manager: [lazy](lua/one/plugin-manager/lazy.lua) (default) or [vim-plug](lua/one/plugin-manager/vim-plug.lua) or [packer](lua/one/plugin-manager/packer.lua)
  - Vim Options: [vim-options](lua/one/plugins/vim-options.lua)
  - Utilities: [plenary](https://github.com/nvim-lua/plenary.nvim) and [Penlight](https://github.com/lunarmodules/Penlight) and [nui](https://github.com/MunifTanjim/nui.nvim)
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
  - Syntax Highlight: [treesitter][] and [nvim-ts-rainbow](lua/one/plugins/treesitter/rainbow.lua) and [nvim-treesitter-pairs](lua/one/plugins/treesitter/pairs.lua)
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
  - Start Speed Up: [impatient.nvim][]
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
  - Color Highlighter: [ccc.nvim](lua/one/plugins/colors/ccc.lua) (default) or [vim-hexokinase](lua/one/plugins/colors/hexokinase.lua) or [nvim-colorizer](lua/one/plugins/colors/colorizer.lua)
  - Translation: [translate.nvim](lua/one/plugins/translate.lua)
  - [Games](lua/one/plugins/funny.lua)
  - one.nvim enhanced plugin: [one](lua/one/plugins/one.lua)

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

## [Installation](./doc/install-and-init.md)

## Update

The source codes of one.nvim, impatient.nvim and [plugin manager](#plugin-manager) are not managed by plugin manager.
You can update them by lua functions or commands.

- Update one.nvim: `:OneUpdate one` or `:lua one.update('one')`
- Update impatient: `:OneUpdate impatient` or `:lua one.update('impatient')`
- Update pm: `:OneUpdate pm` or `:lua one.update('pm')`
- Update all: `:OneUpdate` or `:OneUpdate all` or `:lua one.update()`

## [FAQ](./doc/faq/README.md)

## Configuration

```lua
require('one').setup {}
```

All config options are optional. You can override default configs.
Please read [User Config](./doc/user-config.md).

## Plugin Manager

Choose your favorite plugin manager. Now available: `lazy` (default), `vim-plug` and `packer`.

```lua
require('one').setup {
  config = {
    pluginManager = { use = 'packer' }, -- 'lazy' or 'vim-plug' or 'packer'
  },
}
```

|                   | lazy                    | vim-plug                    | packer                                      |
|-------------------|-------------------------|-----------------------------|---------------------------------------------|
| Plugins Directory | {DATA_DIR}/plugins      | {DATA_DIR}/plugins          | {DATA_DIR}/site/pack/user/start/packer.nvim |
| Default Config    | lua/one/config/lazy.lua | lua/one/config/vim-plug.lua | lua/one/config/packer.lua                   |

The value of `{DATA_DIR}` is `:lua print(vim.fn.stdpath('data'))`.

When you change to packer from lazy or vim-plug, the plugins should be reinstalled. Read [initialization](./doc/install-and-init.md#initialization) for details.

## Plugin

All plugins can be turned off, overridden default config options, replaced with your favorites.
It is highly flexible to be customized and extended.

Read [./doc/plugin.md](./doc/plugin.md) for plugin definitions and references.

You can even set `onlyPlugins = {}` to disable all plugins. Read [Debug - Disable other plugins](./doc/usage/debug.md#disable-other-plugins).

You can invoke `:OneShowPlugins` to view disabled and enabled plugins.

## Colors and Highlights

It's highly dependent on [treesitter][]. If syntax highlights not work, check your [treesitter parsers](https://github.com/nvim-treesitter/nvim-treesitter#language-parsers) correct.
Read [./doc/treesitter.md](./doc/treesitter.md) for troubleshooting.

You can override the default colors and highlights.
Read [./doc/colors.md](./doc/colors.md) for more details.

### Color Space

The colors are desiged based on [Display P3](https://www.color.org/chardata/rgb/DisplayP3.xalter) color space. It works for MacOS and iTerm2 users.

If your nvim colors looks different from below picture. Your terminal is not under Display P3 color space.
You may try [sRGB colors](lua/one/colors/srgb.lua). Read [Colors - Color Space](./doc/colors.md#color-space) for details.

<img src="https://media.githubusercontent.com/media/adoyle-h/_imgs/master/github/one.nvim/colors.png" height="400px" />

## Notice

`$VIMRUNTIME/filetype.vim` won't be loaded. Filetype detected in [./lua/one/plugins/filetype.lua](./lua/one/plugins/filetype.lua)。

Read [./doc/note.md](./doc/note.md) for other notes.

## [Usage](./doc/usage/README.md)

- [Debug](./doc/usage/debug.md)
- [Keymaps](./doc/usage/keymaps.md)
- [Commands](./doc/usage/commands.md)
- [Snippets](./doc/usage/snippet.md)
- [LSP](./doc/usage/README.md#lsp)
- [Code Format](./doc/usage/README.md#code-format)
- [Telescope Extensions](./doc/usage/README.md#telescope-extensions)
- [Window Picker](./doc/usage/README.md#window-picker)
- [Float Cmdline](./doc/usage/README.md#float-cmdline)
- [Unloaded Plugins](./doc/usage/README.md#unloaded-plugins)
- [Extend your plugins/highlights/commands and so on](./doc/usage/README.md#extend-your-pluginshighlightscommands-and-so-on)
- [Global Variable](./doc/usage/README.md#global-variable)
- [Proxy](./doc/usage/proxy.md)

## API

Just read [codes](./lua/one/init.lua).

## Project File Structure

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

## Startup Time

```lua
require('one').setup {
  plugins = {
    { 'profiling', disable = false }, -- This plugin is disabled in default
  }
}
```

Enable [profiling](./lua/one/plugins/profiling.lua) plugin, and invoke `:StartupTime` in nvim. It will print each time on startup.

## Suggestion, Bug Reporting, Contributing

**Before opening new Issue/Discussion/PR and posting any comments**, please read [./CONTRIBUTING.md](./CONTRIBUTING.md).

## Copyright and License

Copyright 2016-2023 ADoyle (adoyle.h@gmail.com). Some Rights Reserved.
The project is licensed under the **BSD 3-clause License**.

Read the [LICENSE][] file for the specific language governing permissions and limitations under the License.

Read the [NOTICE][] file distributed with this work for additional information regarding copyright ownership.

## Other Projects

[Other nvim projects](https://github.com/adoyle-h?tab=repositories&q=&type=source&language=lua&sort=stargazers) created by me.


<!-- links -->

[LICENSE]: ./LICENSE
[NOTICE]: ./NOTICE
[packer.nvim]: https://github.com/wbthomason/packer.nvim
[impatient.nvim]: https://github.com/lewis6991/impatient.nvim
[treesitter]: https://github.com/nvim-treesitter/nvim-treesitter
[lazy.nvim]: https://github.com/folke/lazy.nvim

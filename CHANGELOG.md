# Changelog

All notable changes to this project will be documented in this file.

The format is inspired by [Keep a Changelog](http://keepachangelog.com/en/1.0.0/).

The versions follow the rules of [Semantic Versioning 2.0.0](http://semver.org/spec/v2.0.0.html).

You can use `:OneUpdate` to update one.nvim to latest. Please read [the "Update"](./README.md#update) for details.

## [Unreleased]

[Full Changes](https://github.com/adoyle-h/one.nvim/compare/v5.4.0...HEAD)


<a name="v5.4.0"></a>
## v5.4.0 (2024-09-06 19:53:14 +08:00)

[Full Changes](https://github.com/adoyle-h/one.nvim/compare/v5.3.0...v5.4.0)

### New Features

- **window**: add winshift.nvim plugin to start win-move mode ([4553c48](https://github.com/adoyle-h/one.nvim/commit/4553c48b304b8a83cf15cdcdeb6d864f5bf0716d))

### Bug Fixes

- ignore gitcommit for some plugins ([bdd7859](https://github.com/adoyle-h/one.nvim/commit/bdd785940a524fddf8368759e51a412ad9fc622c))
- adjust window keymaps ([0ae175b](https://github.com/adoyle-h/one.nvim/commit/0ae175baf8e5c35b579ac3822cedbc4bd2d89d63))
  > `<M-w>` -> `<]w>`
  > `<M-W>` -> `<[w>`
- keymaps of comments and code action ([c58f9a8](https://github.com/adoyle-h/one.nvim/commit/c58f9a86a7dc96b85eb3eca159aba53fc04753e2))
  > comments keymaps should same to nvim native keymaps
  > So that <leader>c* -> gc*  <leader>cl -> gcA
  > 
  > Change code action keymap: gc -> gl
- change Visual highlight that not override foreground color ([b14644b](https://github.com/adoyle-h/one.nvim/commit/b14644b369b5dfcee540c03cb20d9dca4ef58cd6))


<a name="v5.3.0"></a>
## v5.3.0 (2024-08-23 17:46:10 +08:00)

[Full Changes](https://github.com/adoyle-h/one.nvim/compare/v5.2.2...v5.3.0)

### New Features

- support to upgrade one.nvim by plugin manager ([0fa6e25](https://github.com/adoyle-h/one.nvim/commit/0fa6e25c1fae7d787c7bf3e42f71312eff338089))

### Bug Fixes

- persisted.nvim has breaking changes ([2a69f74](https://github.com/adoyle-h/one.nvim/commit/2a69f74607e974f002bfd6b76fedb275b1698079))
  > It makes alpha.lua wrong
- **escape**: breaking change in max397574/better-escape.nvim ([d225d91](https://github.com/adoyle-h/one.nvim/commit/d225d91e7358276878b1cfba1803a5a1becc515b))
  > see https://github.com/max397574/better-escape.nvim#rewrite
- **gitsigns**: some config options are deprecated ([8d0b022](https://github.com/adoyle-h/one.nvim/commit/8d0b02213850a573226edf234aa360d731ed4bc0))
  > removed support for yadm, see https://github.com/lewis6991/gitsigns.nvim/pull/1055
  > config.signs.<kind>.[hl,numhl,linehl] are now deprecated, see https://github.com/lewis6991/gitsigns.nvim/pull/1054
- **pretty-fold**: error messages "symbol not found" when using diff ([199e7c7](https://github.com/adoyle-h/one.nvim/commit/199e7c708f5e286a4ed0b02ce47fb64116a4235f))
  > User should upgrade the plugin pretty-fold.nvim by manual.
  > 
  > use bbjornstad/pretty-fold.nvim instead of anuvyklack/pretty-fold.nvim,
  > because the later has not updated since 2 years ago.
  > 
  > related issue: https://github.com/anuvyklack/pretty-fold.nvim/issues/39
  > pr: https://github.com/anuvyklack/pretty-fold.nvim/pull/41
- **whitespace**: whitespace highlights show in dashboard ([0175214](https://github.com/adoyle-h/one.nvim/commit/017521404f7a3858fdb9bef5f6d397ccc87512b4))
  > User should reinstall plugin whitespace.nvim by self.
  > 
  > See https://github.com/johnfrankmorgan/whitespace.nvim/issues/13


<a name="v5.2.2"></a>
## v5.2.2 (2024-06-19 20:17:37 +08:00)

[Full Changes](https://github.com/adoyle-h/one.nvim/compare/v5.2.1...v5.2.2)

### Bug Fixes

- dressing.nvim has a breaking change ([17def1b](https://github.com/adoyle-h/one.nvim/commit/17def1b505e4eb8f9d5c6cac035eafe25a106985))
  > See https://github.com/stevearc/dressing.nvim/commit/cd895f511fc8bd841324c73feb2b9c791b946691
- use folke/noice.nvim instead of adoyle-h/noice.nvim ([ed04251](https://github.com/adoyle-h/one.nvim/commit/ed04251aed2fbe948dfea7875b321bd463c11b48))
  > User should reinstall noice.nvim


<a name="v5.2.1"></a>
## v5.2.1 (2024-06-18 17:38:25 +08:00)

[Full Changes](https://github.com/adoyle-h/one.nvim/compare/v5.2.0...v5.2.1)

### Bug Fixes

- do not split the preview window when substitute ([a7ca3de](https://github.com/adoyle-h/one.nvim/commit/a7ca3deb0e777db0752fdaaebd6e08a4475beb0b))
- trouble.nvim v3 has many breaking changes ([417cb3e](https://github.com/adoyle-h/one.nvim/commit/417cb3e2ed19bf2cc019056c48f71391f9c9c5ac))
  > Please upgrade trouble.nvim to latest.
  > 
  > see https://github.com/folke/trouble.nvim/releases/tag/v3.0.0
- **color**: set highlights Added/Changed/Removed ([b630277](https://github.com/adoyle-h/one.nvim/commit/b630277330bd1d0c7c220503714d3c9cd1a9e6c9))
  > Since neovim 0.10, it uses new default colorscheme "habamax",
  > which breaks legacy vim colorscheme.
- **config**: update symbols ([c6eceb4](https://github.com/adoyle-h/one.nvim/commit/c6eceb44b94a85a4a48bb280dd3e6e6b0e0d2626))

### Document Changes

- better documents ([ead058f](https://github.com/adoyle-h/one.nvim/commit/ead058fa1c94c35b9fafe7046004d385d9c960f9))


<a name="v5.2.0"></a>
## v5.2.0 (2024-05-21 01:24:24 +08:00)

[Full Changes](https://github.com/adoyle-h/one.nvim/compare/v5.1.0...v5.2.0)

### New Features

- reverse highlight of matched brackets and  language-specific keywords ([bc24d43](https://github.com/adoyle-h/one.nvim/commit/bc24d43f8174b16394da6242a107fba8d9203839))

### Bug Fixes

- **neo-tree**: When press "Y", user can choose copy to nvim or system clipboard ([d2ff1eb](https://github.com/adoyle-h/one.nvim/commit/d2ff1eb991e8ec7451137a49ff08cd0c5b8f2276))
  > and fix error when Ctrl-c pressed with selection
- **rainbow**: nvim-ts-rainbow is achieved, use rainbow-delimiters.nvim instead of ([8e459f9](https://github.com/adoyle-h/one.nvim/commit/8e459f99bec37c8b902985f6fec1a711aafba26a))
  > User should install rainbow-delimiters.nvim via plugin manager
- **telescope**: <space>p will show all commands and builtin ex commands ([0be1c8e](https://github.com/adoyle-h/one.nvim/commit/0be1c8e7a5d57cfa4ad53e0a5366c35f8a4c2091))
  > User should upgrade ad-telescope-extensions.nvim and telescope-extension-maker.nvim to latest


<a name="v5.1.0"></a>
## v5.1.0 (2024-05-16 01:22:17 +08:00)

[Full Changes](https://github.com/adoyle-h/one.nvim/compare/v5.0.0...v5.1.0)

### New Features

- **telescope**: add keymaps for move the cusror, preview window and results window ([fd58b92](https://github.com/adoyle-h/one.nvim/commit/fd58b922d65fd06cf03df87be1e2ba152d40eaf7))

### Bug Fixes

- don't give the file info when editing a file ([ea598e4](https://github.com/adoyle-h/one.nvim/commit/ea598e4900f5dc6e1710ccda4e75ec9080e0231e))
- Newly installed LSP without having to restart Neovim ([faeb4ec](https://github.com/adoyle-h/one.nvim/commit/faeb4ec7963958122e8ea03673925e1cbeb1a046))
- **lsp**: change log level: ERROR => WARN ([689a5e7](https://github.com/adoyle-h/one.nvim/commit/689a5e7e0ff82a315ac986dded77da1de92855f2))
  > `:LspLog` will contain WARN level logs
- **noice**: add keymap "`<M-n>`" to clean all visible messages ([a2da095](https://github.com/adoyle-h/one.nvim/commit/a2da095388a27a1776c7ac59c1f2f46af66b7a54))
- **noice**: change the max-width of message window from 50% to 90% ([7469e7a](https://github.com/adoyle-h/one.nvim/commit/7469e7a69dbdb8f44edf0211c2d369e9e40e70ed))


<a name="v5.0.0"></a>
## v5.0.0 (2024-05-11 18:40:48 +08:00)

[Full Changes](https://github.com/adoyle-h/one.nvim/compare/v4.4.0...v5.0.0)

### Breaking Changes

Have 1 breaking changes. Check below logs with ⚠️ .

### New Features

- hidden cmdline && popup cmdline/search/message window && new message history window ([1d744ae](https://github.com/adoyle-h/one.nvim/commit/1d744ae6ba87fdb4b4565dfed78412ee22852cc6))
  > enable noice.nvim
  > 
  > It changes the UI of cmdline and messages. The cmdline is hidden.
  > The messages will show in popup window at bottom-right.
  > The search (`/` and `?`) and vim command (`:`) will show in popup window at bottom-left.
  > 
  > Press `<C-n>` or `:Noice history` to view the message history.
  > 
  > If you don't like it, you can disable this plugin by:
  > `require('one').setup { plugins = { 'noice', disable = true } }`
- add config option "lsp.cursorHoldUptime" which default to 100 ([af13729](https://github.com/adoyle-h/one.nvim/commit/af13729a86da6d889655894b3a127f838b5a3b8d))
- **neo-tree**: change keymaps `<C-u> and <C-d>` to page-up/down in fuzzy finder ([de81693](https://github.com/adoyle-h/one.nvim/commit/de816934fd4eacc524f7f0caa314cf11ee03bfd6))
  > Please upgrade neo-tree.nvim to 3.24+
- **telescope**: the search input will be quoted with live-grep-args in visual selection ([7cd54ee](https://github.com/adoyle-h/one.nvim/commit/7cd54eef3baaba27410a9fca6c8a9c1dea14c73e))
  > and treat the search input as a literal string by adding "-F" option. see "rg --help".

### Bug Fixes

- ⚠️  update symbols for nerdfont v3.2.1 ([2f92991](https://github.com/adoyle-h/one.nvim/commit/2f92991b0a6327e1f5d3472e789df64b27d5e76b))
  > Breaking Change:
  > 
  > User should reinstall the latest nerdfont
- **lsp**: add --enable-config option for clangd ([c610833](https://github.com/adoyle-h/one.nvim/commit/c610833c450286ef2b570f3649d022649e6ce2d6))
- **notify**: press "q" to quit notify window ([43d00c3](https://github.com/adoyle-h/one.nvim/commit/43d00c3601d988d03cba52ecb051b58c57b0a1f2))
- **telescope**: press "`<C-'>`" to quote prompt in live-grep-args picker ([da8bf8f](https://github.com/adoyle-h/one.nvim/commit/da8bf8fbe235947cd9153129909e328a3269020b))


<a name="v4.4.0"></a>
## v4.4.0 (2024-03-28 17:32:55 +08:00)

[Full Changes](https://github.com/adoyle-h/one.nvim/compare/v4.3.4...v4.4.0)

### New Features

- enable iamcco/markdown-preview.nvim by default ([038fc0a](https://github.com/adoyle-h/one.nvim/commit/038fc0a73c5806ae92a00e354ef829c2f59af609))
  > If download markdown-preview binary files failed, you can run command "MarkdownPeviewInstall" to download again.
  > 
  > Note: If you are in China, please use proxy to download.
- use telescope-live-grep-args.nvim instead of live_grep ([39266b6](https://github.com/adoyle-h/one.nvim/commit/39266b659867709f3853fc427b62f5755eacf5be))

### Bug Fixes

- add requirements for latest rcarriga/nvim-dap-ui ([2956bfc](https://github.com/adoyle-h/one.nvim/commit/2956bfceb416d101fd3982d326609c65272ebb96))
- **session**: the session list missing ([57a68a5](https://github.com/adoyle-h/one.nvim/commit/57a68a5eb3df951a08db9f65f32ff13af8ebf556))
  > For latest persisted.nvim, the session name changed. It removed initial "/".
  > 
  > fix the wrong path of consts.HOME_DIR.
- **vim-options**: change the display of default nvim statusline ([574ad21](https://github.com/adoyle-h/one.nvim/commit/574ad2129120648bda942edd6909cd02d6f33fdf))
- **vim-options**: missing builtin syntax highlights when start without colors plugin ([27d54f4](https://github.com/adoyle-h/one.nvim/commit/27d54f43540c631e8e5ce570820c4f893f6920aa))

### Document Changes

- update usages ([235da74](https://github.com/adoyle-h/one.nvim/commit/235da7499cce109b5e1fd58dc27676a96249b784))
  > - requires neovim 0.9.2+
  > - update user config
- renew license date ([6bf0676](https://github.com/adoyle-h/one.nvim/commit/6bf067685f52904f6e68a97c01b3fc790e69eb2b))
- **filetype**: add usages about filetypes ([a0ad9f4](https://github.com/adoyle-h/one.nvim/commit/a0ad9f4394f5b0711d789596f1faee796357dcce))


<a name="v4.3.4"></a>
## v4.3.4 (2023-11-25 03:18:26 +08:00)

[Full Changes](https://github.com/adoyle-h/one.nvim/compare/v4.3.3...v4.3.4)

### Bug Fixes

- some icons were updated and moved to new codepoints for nerdfont v3.0.0 ([89452cf](https://github.com/adoyle-h/one.nvim/commit/89452cffd57fd93d928b35b98adf26c87d4cb2a9))
- the repo "readline.nvim" is not found ([7413ea9](https://github.com/adoyle-h/one.nvim/commit/7413ea96ce374e5a15ec8d872f9f00f0afee3664))
  > The github user linty-org is deleted.
- use mirror.ghproxy.com instead of ghproxy.com ([b2ebad2](https://github.com/adoyle-h/one.nvim/commit/b2ebad2610a21e7a390407b9cf0e28c603f05b32))
  > ghproxy.com is banned by GFW
- **notify**: rename command "ClearNotify" to "NotifyClean" and suppress notification ([fcf1c6d](https://github.com/adoyle-h/one.nvim/commit/fcf1c6dcaa8dbd931001a81f35289bb03541e1c4))
  > Suppress notification that pending notifications were dismissed
- **nvim-cmp**: remove mapping `<C-e>` ([1ec0199](https://github.com/adoyle-h/one.nvim/commit/1ec019929c9ce7ded5b07ef99ec0d7fbe5153340))
- **rainbow_csv**: load plugin when filetype equals one of csv, tsv, tab. ([c58d50d](https://github.com/adoyle-h/one.nvim/commit/c58d50df662506d56d06c69316cea8e7468870a1))


<a name="v4.3.3"></a>
## v4.3.3 (2023-10-04 15:39:19 +08:00)

[Full Changes](https://github.com/adoyle-h/one.nvim/compare/v4.3.2...v4.3.3)

### Bug Fixes

- lock indent-blankline.nvim to v2.20.8 ([d9a6c5d](https://github.com/adoyle-h/one.nvim/commit/d9a6c5de4e5e26e4ef5d0bab64720efe5831f273))
  > indent-blankline.nvim has released v3, but it seems have bugs.
  > So lock it to v2 until v3 works without error.
  > 
  > If you has upgraded it to v3, you should delete indent-blankline.nvim and then install it again.
- error when open one.nvim vimdoc ([a16d39e](https://github.com/adoyle-h/one.nvim/commit/a16d39e5489589731db812db1873b9391acbf2ad))
  > Error shows: "Command not allowed in secure mode in current dir or tag search"
- **ctrlsf**: fix error that "g.ctrlsf_context is undefined" ([f4bdaed](https://github.com/adoyle-h/one.nvim/commit/f4bdaede74f8e526cbf1e0d784f8307abd206dd5))
- **indent-line**: align the context indent line to left ([7831451](https://github.com/adoyle-h/one.nvim/commit/78314511c8ff4863a97dca4042501448cf3f9396))
- **neo-tree**: add keymaps. "h" to close opened directory. "l" to open directory and file. ([be4324c](https://github.com/adoyle-h/one.nvim/commit/be4324ca09109adca454ba54c72d90a5725f1685))
- **notify**: set max_height=20 ([fbe70ab](https://github.com/adoyle-h/one.nvim/commit/fbe70ab196b10691a2cda5cc38c4f5e150d0e995))


<a name="v4.3.2"></a>
## v4.3.2 (2023-09-30 17:00:32 +08:00)

[Full Changes](https://github.com/adoyle-h/one.nvim/compare/v4.3.1...v4.3.2)

### Bug Fixes

- **keymap**: reset "/" and "?" to regular search instead of flash.nvim ([78e2768](https://github.com/adoyle-h/one.nvim/commit/78e27681ba781cf1a0fbb57dc8e53228e939e8f5))
  > Because the flash search mode binding to "/" and "?" may cause accidental touch for most vim users.
  > 
  > So I decide to reset it to original. And Use "f/" to enter the flash search mode.
- **neo-tree**: For keymap "Y": use vim.ui.select instead of vim.fn.inputlist ([1c14ee1](https://github.com/adoyle-h/one.nvim/commit/1c14ee1623c48049055ed0771ef295af4491fa4f))
  > And popup the Copied window after selection

### Document Changes

- add vimdoc ([aef3283](https://github.com/adoyle-h/one.nvim/commit/aef328346e9eb7bb6f9cf0b6b60779140a4572b7))
  > `:h one.nvim`, `:h one-keymaps`


<a name="v4.3.1"></a>
## v4.3.1 (2023-09-27 23:16:16 +08:00)

[Full Changes](https://github.com/adoyle-h/one.nvim/compare/v4.3.0...v4.3.1)

### Bug Fixes

- it's unable that one.nvim be managed by plugin manager ([0c102a2](https://github.com/adoyle-h/one.nvim/commit/0c102a21d43a213273e8629cb377da9cb82fc658))
- change Diagnostic* highlight groups ([24608e6](https://github.com/adoyle-h/one.nvim/commit/24608e6e065eebf993cfda5181fd2e10b87630fa))


<a name="v4.3.0"></a>
## v4.3.0 (2023-09-27 21:25:17 +08:00)

[Full Changes](https://github.com/adoyle-h/one.nvim/compare/v4.2.0...v4.3.0)

### New Features

- ~~one.nvim and impatient.nvim are managed by plugin manager~~ (Sorry, it can't) ([4cc9beb](https://github.com/adoyle-h/one.nvim/commit/4cc9beb3e33e388b331472d5d0fd708cb196ed6d))
- add keymap "`<space>`O" to toggle the outline nav window ([5af612f](https://github.com/adoyle-h/one.nvim/commit/5af612fba045271382a7c2c575d93baf8ae4e3a5))

### Bug Fixes

- lazy.core.util.error should be reset ([20734f5](https://github.com/adoyle-h/one.nvim/commit/20734f5f0d328f169c56e9cd39d5e5588ce2e647))
- packer.nvim should manage itself ([c6a1e66](https://github.com/adoyle-h/one.nvim/commit/c6a1e66bbf327f8a9223d09d2b580e46394d90bd))
- use vim.loader.enable() instead of impatient.nvim ([979b48c](https://github.com/adoyle-h/one.nvim/commit/979b48c471febe031f8aa26a70db7b3c16408897))
  > User should upgrade neovim to 0.9 at least.
- add undercurl to Diagnostic highlight groups ([0f532e0](https://github.com/adoyle-h/one.nvim/commit/0f532e081a6572c8d21107760b892926268d7cce))
  > DiagnosticUnderline* use underline instead of undercurl
- **lazygit**: option 'floating_window_corner_chars' is deprecated ([8755c30](https://github.com/adoyle-h/one.nvim/commit/8755c30ff5ada915e39cdd46b87bacaa2416b457))

### Document Changes

- update README ([e7ead7f](https://github.com/adoyle-h/one.nvim/commit/e7ead7fe95e94125c47b33127ba34543ea5eb158))


<a name="v4.2.0"></a>
## v4.2.0 (2023-09-24 21:34:09 +08:00)

[Full Changes](https://github.com/adoyle-h/one.nvim/compare/v4.1.0...v4.2.0)

### New Features

- use flash.nvim instead of hop.nvim ([62345f0](https://github.com/adoyle-h/one.nvim/commit/62345f06f0dfffc81304e0ce21f0d22295e77e86))
  > when you use `/` to search words, it will append a character trigger to the matches.
- using pretty-fold.nvim to change the Folded style ([b97ebee](https://github.com/adoyle-h/one.nvim/commit/b97ebeea8367bcae93413ce4a7fefd98eb04eb49))

### Bug Fixes

- When using the ">>" command, lines starting with '#' are not shifted right. ([e5cdc9c](https://github.com/adoyle-h/one.nvim/commit/e5cdc9c9695eb8af364fbd5768ce471ba5474ed6))
  > Turn off the smartindent. See ':h si'.

### Document Changes

- user should not install one.nvim by plugin manager ([77ed75e](https://github.com/adoyle-h/one.nvim/commit/77ed75e18aecdd3195014f486e6cdf288358b6a2))


<a name="v4.1.0"></a>
## v4.1.0 (2023-07-31 10:02:22 +08:00)

[Full Changes](https://github.com/adoyle-h/one.nvim/compare/v4.0.1...v4.1.0)

### New Features

- **neo-tree.nvim**: upgrade from v2 to v3 ([2cf8804](https://github.com/adoyle-h/one.nvim/commit/2cf8804b36ccc0f9a44fe1d030417a3eae7813d1))
- **plugin**: add plugin hex.nvim ([14f2fa5](https://github.com/adoyle-h/one.nvim/commit/14f2fa500732a6ad1e1c2e0899e6635f1eb5c5ca))
  > Default unloaded. To load it via `require('one').setup { plugins = function(load, config) return { load('hex') } end }`.

### Bug Fixes

- remove cursor motion keymaps W, B, E ([f4e5b13](https://github.com/adoyle-h/one.nvim/commit/f4e5b1333b2054b3e9b624cab6c3cf2355a4a5a5))
  > Recover back to native keymaps
- lazy.nvim should not notify error "Plugin ... is not installed" on startup ([ec03056](https://github.com/adoyle-h/one.nvim/commit/ec030562632c3ef250e6edcab22058ad2bac217f))
- onlyPlugins must be an array of string ([6a2fb9b](https://github.com/adoyle-h/one.nvim/commit/6a2fb9b1b7708c68428ebcceded3c60654e73c7f))
- **dressing**: deprecate the "anchor" config option ([374f646](https://github.com/adoyle-h/one.nvim/commit/374f64644d16f9877bf1444e74790f6f7ed7c9c1))
  > See https://github.com/stevearc/dressing.nvim/issues/106#issuecomment-1656786195

### Document Changes

- update FAQ ([8521d0c](https://github.com/adoyle-h/one.nvim/commit/8521d0cd2719d6fd1cf1e16cb10b16af2e789d15))
- better doc ([91e326e](https://github.com/adoyle-h/one.nvim/commit/91e326ed81d93e0991125a9e96310b507a8cbeb2))
- fix typos in README ([0b9d0e9](https://github.com/adoyle-h/one.nvim/commit/0b9d0e9a0422d0ab22c6557067dff271f43aee8f))


<a name="v4.0.1"></a>
## v4.0.1 (2023-06-19 12:38:57 +08:00)

[Full Changes](https://github.com/adoyle-h/one.nvim/compare/v4.0.0...v4.0.1)

### Bug Fixes

- use legacy branch for fidget.nvim ([58fc549](https://github.com/adoyle-h/one.nvim/commit/58fc549024516f9612b11a849bf8c018e9bf77a0))
  > see https://github.com/j-hui/fidget.nvim/issues/131
- "OneUpdate one" not update one.nvim && "OneUpdate pm" not update lazy.nvim ([c3514c0](https://github.com/adoyle-h/one.nvim/commit/c3514c0efdaf7047a43bca03257cf671cec187b2))

### Document Changes

- **FAQ**: add suggestions for failed luarocks installation ([a3286b5](https://github.com/adoyle-h/one.nvim/commit/a3286b544f7b8d65c35cc2dbaea50b4146e294d6))


<a name="v4.0.0"></a>
## v4.0.0 (2023-06-10 14:44:00 +08:00)

[Full Changes](https://github.com/adoyle-h/one.nvim/compare/v3.0.1...v4.0.0)

### Breaking Changes

Have 1 breaking changes. Check below logs with ⚠️ .

### New Features

- add new pluginManager "local" ([3c5d5d1](https://github.com/adoyle-h/one.nvim/commit/3c5d5d18697d6c533c48860f483e7518871c4938))
- add codeium plugin ([f959a47](https://github.com/adoyle-h/one.nvim/commit/f959a47a42c4dfaa18e14c69a60792f422f37e47))
  > - It is disabled by default.
  > - Use codeium with nvim-cmp: `require('one').setup { plugins = { 'cmp-codeium', disable = false } }`
  > - Use official codeium plugin: `require('one').setup { plugins = function(load) return { load('codeium') } end }`

### Bug Fixes

- ⚠️  filetype.nvim not support neovim 0.9 ([e9440d7](https://github.com/adoyle-h/one.nvim/commit/e9440d7f62546434934e64bde4810f0a46277210)) ([#14](https://github.com/adoyle-h/one.nvim/issues/14))
  > - fix [#14](https://github.com/adoyle-h/one.nvim/issues/14)
  > - use vim.filetype.add to replace nathom/filetype.nvim
  > 
  > Breaking Change:
  > 
  > The content of `config.filetype` is changed.
  > From `{ overrides = { extensions = {}, literal = {}, complex = {} } }`,
  > to `{ extension = {}, filename = {}, pattern = {} }`. See `:h vim.filetype.add` for details.

### Document Changes

- update FAQ ([c141839](https://github.com/adoyle-h/one.nvim/commit/c141839ee7b2bf9339087cf440658c10efac3dd2))


<a name="v3.0.1"></a>
## v3.0.1 (2023-04-23 15:29:13 +08:00)

[Full Changes](https://github.com/adoyle-h/one.nvim/compare/v3.0.0...v3.0.1)

### Bug Fixes

- do not ignore "vendor" folder in file-explorer ([465cac0](https://github.com/adoyle-h/one.nvim/commit/465cac0c6de116074ae7b1c042e6b7f1afcb600c))
- OpenGithub command would be compatible with more formats ([a5b9f44](https://github.com/adoyle-h/one.nvim/commit/a5b9f448a255c183093e0e1fa95c5b9804b51291))
  > - https://github.com/org/repo
  > - github.com/org/repo
  > - org/repo
- **lsp**: lsp is being set up before mason.nvim is set up ([7ffdd51](https://github.com/adoyle-h/one.nvim/commit/7ffdd511856bf1ad7c242934904b5974b4dd1bf3))
- **neo-tree**: change config for latest version of neo-tree.nvim ([4339be2](https://github.com/adoyle-h/one.nvim/commit/4339be2936386507a6e488342f3a5e07461d3f94))
  > - replaces `source_selector.tab_labels` with `source_selector.sources`
  > - see https://github.com/nvim-neo-tree/neo-tree.nvim/pull/877

### Document Changes

- update docs ([727c38f](https://github.com/adoyle-h/one.nvim/commit/727c38fb01f1a34a8c76e0a0cbf3d75a7a9dc010))
- update Changelog ([12461fb](https://github.com/adoyle-h/one.nvim/commit/12461fb32888b6cc12434042e3a33978fbaa07aa))


<a name="v3.0.0"></a>
## v3.0.0 (2023-03-27 17:32:44 +08:00)

[Full Changes](https://github.com/adoyle-h/one.nvim/compare/v2.1.0...v3.0.0)

### Breaking Changes

Have 2 breaking changes. Check below logs with ⚠️ .

### New Features

- add plugin marks.nvim ([017947d](https://github.com/adoyle-h/one.nvim/commit/017947d88e6c34ed5563037fa69e8784b4e3a6c6))
  > The config `force_write_shada` must be `true`. See https://github.com/chentoast/marks.nvim/issues/13
- enable plugin nvim-treesitter-context ([9e8aa19](https://github.com/adoyle-h/one.nvim/commit/9e8aa198059888e2859659eb78ce37d44c5c5418))
  > You can disable it by `require('one').setup { plugins = { { 'nvim-treesitter/nvim-treesitter-context', disable = true } } }`
- make the scrollbar transparent ([e0ec273](https://github.com/adoyle-h/one.nvim/commit/e0ec27355e111205a886314c2cec9779ef614c25))
  > - User should upgrade nvim-scrollbar plugin to latest
  > - The scrollbar config add new option "handle.blend"
  > - Move nvim-scrollbar to plugins/scrollbar/ folder
- add plugin scrollbar/satellite ([8c85211](https://github.com/adoyle-h/one.nvim/commit/8c85211bf9954a83bead4ec159d725365716bd11))
  > This plugin is an alternative to nvim-scrollbar. But it is still WIP.
- add plugin hotoo/pangu.vim ([cd932a1](https://github.com/adoyle-h/one.nvim/commit/cd932a1ee9acb76b80867b3c03142ecce62c7a3c))
- **neo-tree**: add keymaps to move cursor ([6feb493](https://github.com/adoyle-h/one.nvim/commit/6feb493d687bf8f5e0294205a20a025017dc7911))
  > - `<c-j>` = moveToNextSibling
  > - `<c-k>` = moveToPreviousSibling
  > - `J` = moveToLastSibling
  > - `K` = moveToFirstSibling
- **neo-tree**: let fuzzy_finder search as you type && chagne keymaps ([0325820](https://github.com/adoyle-h/one.nvim/commit/0325820782de9d09b776322fde7a76dbcfc1dbe4))
  > - add keymap `F` and `<C-/>` to clear filter
  > - remove keymap `<C-x>`
- **noice**: better config for latest noice.nvim ([9230def](https://github.com/adoyle-h/one.nvim/commit/9230def42fb6d83e59c17d7aea08b2e60e4a059f))
  > But it is still disabled by default, because the messages may be noisy.
  > You can enable it by `require('one').setup { plugins = { { 'noice', disable = false } } }`.
- **telescope**: change the layout of heading extension ([12af9d6](https://github.com/adoyle-h/one.nvim/commit/12af9d66499a505428046e486d118945c3595bed))
  > - Change the layout of heading extension from vertical to horizontal.
  > - User should upgrade the plugin telescope-heading.nvim to latest.
- **treesitter**: add new options "parserConf" and "registerLang" ([7076ded](https://github.com/adoyle-h/one.nvim/commit/7076ded41fea8acaac132b3d1472aef677f4f55e))
  > Usage:
  > 
  > ```lua
  > {
  > 	parserConf = {
  > 		glimmer = function(parserConf) end
  > 	},
  > 
  > 	registerLang = {
  > 		glimmer = { 'hbs' },
  > 	},
  > }
  > ```

### Bug Fixes

- hlslens not setup when disable nvim-scrollbar ([c869b49](https://github.com/adoyle-h/one.nvim/commit/c869b49424b5c2028f734d55e4b1e9f7a93dc47d))
- **alpha**: the first item is not best matched when matched session sum > 9 ([32898b4](https://github.com/adoyle-h/one.nvim/commit/32898b464c303bef2354d26b1896f51b6223189a))
- **dashboard**: revert plugin alpha-nvim to origin repo from my fork ([255ca95](https://github.com/adoyle-h/one.nvim/commit/255ca95f1279544b78bc3fdf95d76d732ffec792))
- ⚠️  **keymap**: Change keymap of comment plugin and add keymap usages ([373ba4e](https://github.com/adoyle-h/one.nvim/commit/373ba4e6240ae24fe7f1b5abdf5823bd1e96601e))
  > Breaking Change:
  > 
  > - Move `<leader>ca` to `<leader> cl`
- ⚠️  **keymap**: Change the keymap of "`<space>`M". ([8be6b30](https://github.com/adoyle-h/one.nvim/commit/8be6b3020630be8f375d66d44b15283d6b2c2347))
  > Breaking Change:
  > 
  > The keymap "<space>M": To open reveal current buffer in file explorer instead of Man page finder.
- **telescope**: don't fill visual selected text when press `<space>p` and `<space>C` ([9795337](https://github.com/adoyle-h/one.nvim/commit/979533743635cc97f3875f3544c2f3749f7f0545))


<a name="v2.1.0"></a>
## v2.1.0 (2023-02-28 20:46:40 +08:00)

[Full Changes](https://github.com/adoyle-h/one.nvim/compare/v2.0.0...v2.1.0)

### New Features

- **trouble**: change the diagnostics format ([91bb9a6](https://github.com/adoyle-h/one.nvim/commit/91bb9a6166cb7d68427d5ea42edd5e6bebbe3e88))
  > - User should update trouble.nvim to latest

### Bug Fixes

- update lazygit config ([d064837](https://github.com/adoyle-h/one.nvim/commit/d064837588cea77839b7bb98057f223221da51e9))
- show winbar in inactive windows ([968f435](https://github.com/adoyle-h/one.nvim/commit/968f43578b1c63cce1c993151fdb9c0e32c90f86))
- show winbar in inactive windows ([8ce6b0c](https://github.com/adoyle-h/one.nvim/commit/8ce6b0c402cdac562c661388581d213c8207e89e))
- change ColorColumn and FloatBorder colors ([a697e62](https://github.com/adoyle-h/one.nvim/commit/a697e6207a24a54d70fb4d278d7252b3583c8199))

### Document Changes

- update Screenshots ([87bb5d6](https://github.com/adoyle-h/one.nvim/commit/87bb5d6b921a2b5e774a637eee4f212e97a0c631))


<a name="v2.0.0"></a>
## v2.0.0 (2023-02-25 18:22:55 +08:00)

[Full Changes](https://github.com/adoyle-h/one.nvim/compare/v1.1.1...v2.0.0)

### Breaking Changes

Have 1 breaking changes. Check below logs with ⚠️ .

### New Features

- use new color theme "one" as default ([77c7faf](https://github.com/adoyle-h/one.nvim/commit/77c7faf269d02dd588b20b284ab823cbc11c636d))
- add themes "tokyonight", "catppuccin" and "nightfox" ([e23e054](https://github.com/adoyle-h/one.nvim/commit/e23e05498deb089c1e3029b9861f288f28d15f45))
- support lazy.nvim && use lazy as default plugin manager ([0ac4265](https://github.com/adoyle-h/one.nvim/commit/0ac4265df87db19d52bc9fbf55473972a94755ed))
  > - fix the "run" function not be callbacked with packer.nvim
- add new telescope pickers: ts-parsers and plugins ([7e5aa7a](https://github.com/adoyle-h/one.nvim/commit/7e5aa7a181e79317ab3b6fb0c7aa349f1a473e20))
- ⚠️  add keymaps for lsp_document_symbols_filter and lsp_workspace_symbols_filter ([827c82d](https://github.com/adoyle-h/one.nvim/commit/827c82dc18c08bb9d57228a3d3a57ff5b889e66a))
  > Breaking Change:
  > 
  > The keymap `<space>l` changed to `<space>ls` for `:Telescope lsp_document_symbols`
- add plugin Penlight && use pl.pretty instead of vim.inspect in OneShowConfig and OneShowPlugins ([6900704](https://github.com/adoyle-h/one.nvim/commit/690070451c7c07f052e4c041b92bef0d727a34a9))
- better diagnostic message in float window when hover ([4b45aee](https://github.com/adoyle-h/one.nvim/commit/4b45aee2cf870c95f6ece3292379cdf6b981fef6))
  > Preview:
  > 
  > ```
  > ╭──────────────────────────────────────────────────────────────────────────────────╮
  > │Diagnostics:                                                                      │
  > │  8 shellcheck: [SC2001] See if you can use ${variable//search/replace} instead.│
  > ╰──────────────────────────────────────────────────────────────────────────────────╯
  > ```
  > 
  > - : The diagnostic severity
  > - 8: diagnostic at column number 8
  > - shellcheck: diagnostic source
  > - [SC2001]: diagnostic code
  > - diagnostic message at last
- **keymaps**: add `<C-t>o`, `<C-t>-`, `<C-w>o` ([96b8fbc](https://github.com/adoyle-h/one.nvim/commit/96b8fbc731ad9734315cab8ac7dd82ae16d5e6f6))
- **neo-tree**: use ✦ to show file executable ([d63a127](https://github.com/adoyle-h/one.nvim/commit/d63a1277ab2f9e4fd5c005a232c2bed0cb722581))
- **neo-tree**: show symlink with relative path ([a238889](https://github.com/adoyle-h/one.nvim/commit/a23888980986f763b9664b6ac0dea1e6eda1b544))
- **snippet**: add command SnippyCreate ([53af02e](https://github.com/adoyle-h/one.nvim/commit/53af02ea156df3919408abd4e5a9a5711ea664b7))
  > to create new snippet file.

### Bug Fixes

- git diff colors for latest onedarkpro ([2f800ab](https://github.com/adoyle-h/one.nvim/commit/2f800ab84fa07482e653f86ceb5edf8f1f9bf4fa))
  > - refactoring color codes
  > - add lua/one/colors/util.lua : improve color codes
  > - remove lua/one/config/colors.lua : it is useless.
- disable markdown-preview plugin as default ([779d35d](https://github.com/adoyle-h/one.nvim/commit/779d35d5864d6d48354e6bbcab712c179d1f5b77))
  > - Because it will download files from github release in mkdp#util#install function. That will hang up for Chinese users.
  > - You can enable it in your config, if you have proxy or just be out of China.
- OneShowPlugins will show calculated result instead of function address when option is a function ([9921bda](https://github.com/adoyle-h/one.nvim/commit/9921bdac5b8492264306a7c87f0a1d605310597d))
- remove keymaps of table-mode && add commands TableModeToggleGFM and TableModeToggleNormal ([6077cfb](https://github.com/adoyle-h/one.nvim/commit/6077cfb22cc603ec33181f75da6e7e65f500cbee))
- update plugins highlight groups ([7edefb5](https://github.com/adoyle-h/one.nvim/commit/7edefb5ebdc7faf6945934f0f0aaa3ba79b8538c))
- **aerial**: aerial hang up && remove option "autoFoldLevel" && change guides spaces ([b965f3e](https://github.com/adoyle-h/one.nvim/commit/b965f3e7fadff81c353382cf59215e634aebbd34))
- **aerial**: do not ignore man buffers ([1de70ff](https://github.com/adoyle-h/one.nvim/commit/1de70ff6e75680de23589e94223930d0586f7b71))
- **neo-tree**: components not found in buffers, git_status and zk panes ([535f3eb](https://github.com/adoyle-h/one.nvim/commit/535f3eba8f4b4386176e5b07de536f79ab90e283))
- **nvim-window-picker**: changes repo from fork to origin ([8c1a745](https://github.com/adoyle-h/one.nvim/commit/8c1a74510142c2bfe870cf90a4f2ed0ba75a3b4d))
- **persisted.nvim**: move some deprecated options to autocmds for latest version of persisted.nvim ([e933ebf](https://github.com/adoyle-h/one.nvim/commit/e933ebf524054fb6ab05e0ec288d4530833439b9))
  > - https://github.com/olimorris/persisted.nvim/issues/51
- **plugin**: markdown toc support all options ([57e6118](https://github.com/adoyle-h/one.nvim/commit/57e6118429c4d30dd87877adaedc9deff1f2f142))
- **plugin**: increment add candidates "enable/disable" ([125e9a4](https://github.com/adoyle-h/one.nvim/commit/125e9a4f43e3e76343a8878a0e8f599e305e38d4))
- **rainbow**: update colors ([49459cf](https://github.com/adoyle-h/one.nvim/commit/49459cf0f5a12d1c63a7018ac40bb138db9eac18))

### Document Changes

- Color Gamut -> Color Space ([cf20008](https://github.com/adoyle-h/one.nvim/commit/cf2000869d379caced94fbecb336c4252c8ec3d4))
- update CONTRIBUTING ([b28686e](https://github.com/adoyle-h/one.nvim/commit/b28686eec80d93d184b18c83c8e29b066a46e809))
- improve CONTRIBUTING docs ([f9bd7c7](https://github.com/adoyle-h/one.nvim/commit/f9bd7c7448bb820f2a6028b761180d99175a892f))
- add FAQ ([79fbc2e](https://github.com/adoyle-h/one.nvim/commit/79fbc2efcc90214ac2d354f581ea6030e931c77d))
- add FAQ ([70e3049](https://github.com/adoyle-h/one.nvim/commit/70e3049589d66a5ace87a3d6dc00e28cbd70ea15))
- renew license date ([948e446](https://github.com/adoyle-h/one.nvim/commit/948e4463ee5c6bb5fc149fcefc4a3e0db9b23c19))
- update documents for CONTRIBUTING ([2510a2a](https://github.com/adoyle-h/one.nvim/commit/2510a2a6c3818563fbc2d59615bc4a36b3160ce1))
  > And fix keymap typo
- update doc/install-and-init.md ([950c1e8](https://github.com/adoyle-h/one.nvim/commit/950c1e84823ba919a30681884d6d8396add36896))
- renew license date ([c302677](https://github.com/adoyle-h/one.nvim/commit/c30267754c21145e7da389fbf307c722f6221247))
- move ./doc/contribution.md to CONTRIBUTING.md ([6216d0d](https://github.com/adoyle-h/one.nvim/commit/6216d0da09566849548bc16b1abd960a4d021f40))


<a name="v1.1.1"></a>
## v1.1.1 (2022-12-15 13:52:01 +08:00)

[Full Changes](https://github.com/adoyle-h/one.nvim/compare/v1.1.0...v1.1.1)

### Bug Fixes

- plugins using "after" option are not loaded [[3e28652](https://github.com/adoyle-h/one.nvim/commit/3e286526d2afd505dbed628021c28985dc4dbee2)]
- remove keymap "t" [[00cd3ac](https://github.com/adoyle-h/one.nvim/commit/00cd3aca322f930d171281676f45a19d755bbb08)]
  ```
  Keep "t" to default motion for user.
  ```

- **onedarkpro**: colorscheme onedarkpro is deprecated for latest plugin [[62316bc](https://github.com/adoyle-h/one.nvim/commit/62316bcdb7009dee9336723f1ce4c68b3ff783dc)]

<a name="v1.1.0"></a>
## v1.1.0 (2022-12-07 18:41:13 +08:00)

[Full Changes](https://github.com/adoyle-h/one.nvim/compare/v1.0.0...v1.1.0)

### New Features

- add "one" plugin [[7bbe175](https://github.com/adoyle-h/one.nvim/commit/7bbe1750335300bc87b49e000bf54c24012e7dbe)]
  ```
  - add commands and functions for one.nvim
  ```

- allow user disable lsp-format and mason-null-ls [[d0f9b7a](https://github.com/adoyle-h/one.nvim/commit/d0f9b7a1e6687ec2e75275ea14d086e66d1aa4ee)]
  ```
  - remove autocmd User/MasonNullLsUpdateCompleted
  ```

- support format in selection && "_" option matching all filetypes for lsp format [[2a1b710](https://github.com/adoyle-h/one.nvim/commit/2a1b7106e661228ef694ee648b2521f158baec6f)]
  ```
  - change keymaps from "gF" to "<M-=>"
  - remove lsp.format default config option "lua.exclude"
  ```

- user can set config.theme.use = false to disable default theme [[022cdef](https://github.com/adoyle-h/one.nvim/commit/022cdefccf63ec8691c8513e5cd22ed28438e08f)]
- plugin's deps and requires allow false and nil item, they will be ignored [[0fa4331](https://github.com/adoyle-h/one.nvim/commit/0fa43310b27d4845cfc2b6d21720fd7453076029)]
- provide colors for different color gamut [[b5974cb](https://github.com/adoyle-h/one.nvim/commit/b5974cb6fde0583506b54c9e7a7211bfda3e339d)]
- plugin option "after" also work for vim-plug now [[2c896fe](https://github.com/adoyle-h/one.nvim/commit/2c896fe80ff77372427d5fe82fd01c2f852fbdc2)]
  ```
  - If one of these plugins is disabled, current plugin will be disabled.
  ```


### Bug Fixes

- remove message "mason-tool-installer has finished" [[d0a4792](https://github.com/adoyle-h/one.nvim/commit/d0a4792b5a9528ca020bb176bd7b89a9a3712162)]
- **alpha**: put matched session top [[bf92689](https://github.com/adoyle-h/one.nvim/commit/bf92689953d128a19f6526d65f86d4dbb2bcbf0b)]
- **devicons**: chang svg icon [[f318308](https://github.com/adoyle-h/one.nvim/commit/f31830851d98ac6c23f147c7b8f592b5d5e520e5)]
- **dressing**: move winblend and winhighlight to win_options for latest version [[57107c7](https://github.com/adoyle-h/one.nvim/commit/57107c7eb69813bc166744a56fabfaacb91e4d0e)]
- **scrollbar**: hide cursor mark in scrollbar [[7748c47](https://github.com/adoyle-h/one.nvim/commit/7748c4786486c3d46c1a6983691c0e7bfb389dc1)]

### Document Changes

- improve documents && fix links [[7046d45](https://github.com/adoyle-h/one.nvim/commit/7046d45ec93c422e7a318d01291ca3bf380dfe71)]
- do not create keymaps and commands in configFn [[0053166](https://github.com/adoyle-h/one.nvim/commit/0053166018dac893acdeb1601a9ea55877af5664)]

<a name="v1.0.0"></a>
## v1.0.0 (2022-11-18 13:43:00 +08:00)



### New Features

- use ccc.nvim instead of nvim-colorizer as default inline colorizer [[3fd996c](https://github.com/adoyle-h/one.nvim/commit/3fd996c406bd44b48fff9a9fb5fbcc74fc8619f8)]
  ```
  - Because when using nvim-colorizer, open a large file will be very slow.
  - add vim-hexokinase plugin as another choice. But it requires golang.
  ```

- add :TranslateTargetLang and :TranslateCommand commands [[0085ffa](https://github.com/adoyle-h/one.nvim/commit/0085ffa52347ccea0dba44ebab2b19e63f177d6d)]
- add translate plugin [[89815e3](https://github.com/adoyle-h/one.nvim/commit/89815e37817fec69e57f95fd6cb3aff96b571a94)]
- add one.reset() to clear plugins and cached files for users trapped by packer [[f86567d](https://github.com/adoyle-h/one.nvim/commit/f86567dd3d4dcbf04c6dd352b0a6cd05e80c2344)]
- add option "chunks" and "modpaths" for impatient [[0f3c6fa](https://github.com/adoyle-h/one.nvim/commit/0f3c6fa73153d326718d56a59dee57bea9858e50)]
- plug command prop supports string and function parameter [[7deda66](https://github.com/adoyle-h/one.nvim/commit/7deda6639849e003d552351e924031a83e958ac7)]
- add async lib [[429f87e](https://github.com/adoyle-h/one.nvim/commit/429f87e8eb94229da6e08eb895b97c5a1622dd54)]
- **cmp**: add option "experimental.ghost_text" [[1a3e956](https://github.com/adoyle-h/one.nvim/commit/1a3e956132f6bb511cb6957c11ce3bcc325b7a30)]
- **neo-tree**: add keymap "Y" to copy filepath/filename of the node under cursor [[2adfdcf](https://github.com/adoyle-h/one.nvim/commit/2adfdcf09c676e733aa826f1d06d6967be21c165)]
- **plugin**: add edluffy/specs.nvim [[902252d](https://github.com/adoyle-h/one.nvim/commit/902252dbb629bb5690f2136285e95eabc511844f)]
- **plugin**: add floaterm [[9638752](https://github.com/adoyle-h/one.nvim/commit/963875286510b289be3c5c62ad5636171a7f7615)]
- **plugin**: add beacon [[fe0e94b](https://github.com/adoyle-h/one.nvim/commit/fe0e94b482a9a90c1af7cff6e28f55fbf52382f4)]

### Bug Fixes

- support to set plugin id by manual [[a1ec3ea](https://github.com/adoyle-h/one.nvim/commit/a1ec3eaec14544cdcbfaa5e53808cc89158dabbb)]
- disable treesitter highlight when open large file [[8cf662d](https://github.com/adoyle-h/one.nvim/commit/8cf662da75ece38de07f936e36eeeb43b9b32c94)]
- table.unpack is nil [[1681d6a](https://github.com/adoyle-h/one.nvim/commit/1681d6ab7a7a76757eaf06b3683698964c811edc)]
- change default config.global from "a" to "one" && add document [[81374d7](https://github.com/adoyle-h/one.nvim/commit/81374d708c4fdbbb01b049957021f78f26d25e9c)]
- duplicated isPlugDisabled && fix <space>n in dashboard && fix disabled requires plugins [[d43b620](https://github.com/adoyle-h/one.nvim/commit/d43b620729d939c448e4bca86918450434ae546a)]
  ```
  - PM.isPlugDisabled and PM.isDisabled are duplicated
  - When noice is disabled, <space>n should call :Telescope message
  - depPlug.isDisabled is a typo
  ```

- let user load disabled plugins as required [[d4c24d4](https://github.com/adoyle-h/one.nvim/commit/d4c24d4acdd6c36880e9f4a98f0f751aed34cb2f)]
- lsp/fidget plug should be enabled by default [[a3b9a9b](https://github.com/adoyle-h/one.nvim/commit/a3b9a9b90ef39bd71b700805c0a27e40eac03bd2)]
- keymap <space>n to list messages [[f76c505](https://github.com/adoyle-h/one.nvim/commit/f76c505744e554f9d347fa204b5781a3f208a10e)]
- **bufferline**: tab move keymaps [[0cb09bd](https://github.com/adoyle-h/one.nvim/commit/0cb09bd746b9b351f3e512814451ef9d2f52d3c0)]
- **noice**: add padding in mini view [[afcecd6](https://github.com/adoyle-h/one.nvim/commit/afcecd626d4f795b45fb4c49797d5483fb7d7d17)]
- **notify**: Always wrap text in Notify popup window [[cff790c](https://github.com/adoyle-h/one.nvim/commit/cff790c22b7cb43f7ab3de9534b44b5c9a13d608)]
- **plugin**: beacon config [[cee4f95](https://github.com/adoyle-h/one.nvim/commit/cee4f956187a6ef5b3f142eea3a67d8bcbd666f9)]
- **plugin**: do not highlight cursorline in dashboard [[515a952](https://github.com/adoyle-h/one.nvim/commit/515a952c05b8d7c75ce360831efd6c954d17d3e0)]
- **plugin**: window-picker config use_winbar="smart" [[92bb681](https://github.com/adoyle-h/one.nvim/commit/92bb681306dedbcf1152b483e505b43c97008148)]
- **plugin**: yank keymaps [[7b99f26](https://github.com/adoyle-h/one.nvim/commit/7b99f26a36c30d6d572cb3b56ee37ef85e728726)]
- **plugin**: beacon.nvim support fader option [[a3527f5](https://github.com/adoyle-h/one.nvim/commit/a3527f5434994a5b65b7f485ed2365238731366f)]

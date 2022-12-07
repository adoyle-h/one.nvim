# Changelog

All notable changes to this project will be documented in this file.

The format is inspired by [Keep a Changelog](http://keepachangelog.com/en/1.0.0/).

The versions follow the rules of [Semantic Versioning 2.0.0](http://semver.org/spec/v2.0.0.html).

## [Unreleased]

[Full Changes](https://github.com/adoyle-h/one.nvim/compare/master...develop)

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

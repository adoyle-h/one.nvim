# Installation

[English](./install-and-init.md) | [中文](./install-and-init.zh.md)

You can use git clone to install. Or run nvim in container.

## Dependencies

- [NVIM v0.8][] or later
- python3、pip3
- nvim python provider
  - `pip3 install --upgrade --user pynvim`
  - `pip2 install --upgrade --user pynvim` (it is optional)
- Git and curl
- A C compiler in your path and libstdc++ installed. (Required by [treesitter](https://github.com/nvim-treesitter/nvim-treesitter#requirements))
- [Nerd Font][]. Recommend [DejaVuSansMonoForPowerline Nerd Font][font]. Remember to change your terminal font setting. (The icons may look small. It is [a bug of nerd-fonts](https://github.com/ryanoasis/nerd-fonts/issues/1061))
- [ripgrep(rg)](https://github.com/BurntSushi/ripgrep)
- Linux and MacOS are supported. Windows not.

## Versions

It's recommended to use `master` branch which should be always stable.
You can try `develop` branch for latest update but may be unstable.

Read [tags][] for verions.
The versions follow the rules of [Semantic Versioning 2.0.0](http://semver.org/spec/v2.0.0.html).

## git clone

```sh
PACK_DIR=${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/pack/user/start
mkdir -p "$PACK_DIR"
git clone --depth 1 --single-branch https://github.com/adoyle-h/one.nvim.git "$PACK_DIR"/one.nvim
```

Do [initialization](#initialization) and then press `nvim` to get started.

## Initialization

1. Create [neovim `init.lua` file](https://neovim.io/doc/user/lua-guide.html#lua-guide-config).

    - For minimal config, just run

      ```sh
      NVIM_HOME=$HOME/.config/nvim
      mkdir -p "$NVIM_HOME"
      echo "require('one').setup {}" > "$NVIM_HOME/init.lua"
      ```

    - One.nvim uses [lazy.nvim][] as default plugin manager. You can change by `config.pluginManager.use`. Read [Plugin Manager](../README.md#plugin-manager) for details.
    - One.nvim will install plugin manager on start up. So user should not install one.nvim via plugin manager.
    - It maybe be slow to download plugins. Modify `config.proxy.github` option to use proxy. Read [Proxy](./usage/proxy.md) for details.
    - You can refer to [my init.lua][init.lua] for more complex config.

2. Call `nvim` to open neovim. It will auto download dependent packages, including impatient.nvim and lazy.nvim/vim-plug/packer.nvim. And then auto download plugins.

3. When plugins installed failed. See [FAQ - Plugins Installed Failed](./faq/install-failed.md#plugins-installed-failed).

4. It will auto download treesitter parsers, which defined in `config.treesitter.ensure_installed` and `config.treesitter.ignore_install`. If install failed, restart nvim or run `:TSInstall all` to install them.

5. It will auto download LSP/DAP/Formatter/Linter, which defined in `config['mason-installer'].ensureInstalled`.

    - If failed, restart nvim or run `:MasonToolsInstall` to install them.
    - Or press `<M-m>` to open Mason window to choose LSP/DAP/Formatter/Linter.


## Container

You can also use it in container. It requires docker installed on your machine.

### Build container

Invoke [`scripts/build-container`](../scripts/build-container).
(For users in China Mainland, it's recommended to add `-p` option to enable proxy for fasten building).

**Note** for Mac users with Apple chip. Current nvim not provide releases building for Arm arch. So the container builds and runs with `--platform=linux/amd64` option. It's very slow when running it in container.

### Use container

```sh
# Cache the nvim data in host
docker volume create nvim-data
# It's recommended to add this line to ~/.bashrc
alias nvim='docker run --rm -it --platform linux/amd64 -v "$HOME/.config/nvim:/root/.config/nvim" -v "nvim-data:/root/.local/share/nvim" -v "$PWD:/workspace" adoyle/one.nvim:v0.8.0'
```

Do [initialization](#initialization) and then press `nvim` to get started.


<!-- links -->

[tags]: https://github.com/adoyle-h/one.nvim/tags
[font]: https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/DejaVuSansMono
[Nerd Font]: https://github.com/ryanoasis/nerd-fonts
[mason.nvim]: https://github.com/williamboman/mason.nvim
[null-ls]: https://github.com/jose-elias-alvarez/null-ls.nvim
[nvim-lspconfig]: https://github.com/neovim/nvim-lspconfig
[NVIM v0.8]: https://github.com/neovim/neovim/releases/tag/v0.8.0
[init.lua]: https://github.com/adoyle-h/neovim-config/blob/master/init.lua
[packer.nvim]: https://github.com/wbthomason/packer.nvim
[impatient.nvim]: https://github.com/lewis6991/impatient.nvim
[treesitter]: https://github.com/nvim-treesitter/nvim-treesitter
[lazy.nvim]: https://github.com/folke/lazy.nvim

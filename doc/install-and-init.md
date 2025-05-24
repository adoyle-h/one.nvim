# Installation

[English](./install-and-init.md) | [中文](./install-and-init.zh.md)

You can use git clone to install. Or run nvim in container.

## Dependencies

- Neovim 0.11.0 or later
- python3、pip3
- nvim python provider
  - `pip3 install --upgrade --user pynvim`
  - `pip2 install --upgrade --user pynvim` (it is optional)
- Git and curl
- A C compiler in your path and libstdc++ installed. (Required by [treesitter](https://github.com/nvim-treesitter/nvim-treesitter#requirements))
- [Nerd Font][]. Recommend [DejaVuSansMonoForPowerline Nerd Font][font]. Remember to change your terminal font setting. (The icons may look small. It is [a bug of nerd-fonts](https://github.com/ryanoasis/nerd-fonts/issues/1061))
- [ripgrep(rg)](https://github.com/BurntSushi/ripgrep)
- [luarocks](https://luarocks.org/) and [penlight](https://github.com/lunarmodules/Penlight).
  - install luarocks: https://github.com/luarocks/luarocks/wiki/Download
  - install penlight: `luarocks install penlight`
- Linux and MacOS are supported. Windows not.

## Versions

It's recommended to use `master` branch which should be always stable.
You can try `develop` branch for latest update but may be unstable.

Read [tags][] for verions.
The versions follow the rules of [Semantic Versioning 2.0.0](http://semver.org/spec/v2.0.0.html).

## git clone

```sh
PLUGIN_DIR=${XDG_DATA_HOME:-$HOME/.local/share}/nvim/plugins
mkdir -p "$PLUGIN_DIR"
git clone --single-branch https://github.com/adoyle-h/one.nvim.git "$PLUGIN_DIR"/one.nvim
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

2. Call `nvim` to open neovim. It will auto download dependent packages, including plugin manager (lazy.nvim/vim-plug/packer.nvim). And then auto download plugins.

3. When plugins installed failed. See [FAQ - Plugins Installed Failed](./faq/install-failed.md#plugins-installed-failed).

4. It will auto download treesitter parsers, which defined in `config.treesitter.ensure_installed` and `config.treesitter.ignore_install`. If install failed, restart nvim or run `:TSInstall all` to install them.

5. It will auto download LSP/DAP/Formatter/Linter, which defined in `config['mason-installer'].ensureInstalled`.

    - If failed, restart nvim or run `:MasonToolsInstall` to install them.
    - Or press `<M-m>` to open Mason window to choose LSP/DAP/Formatter/Linter.


## Container

You can also use it in container. It requires docker installed on your machine.

### Use container

```sh
# Create docker volume for caching the nvim data in host
docker volume create nvim-data
# It's recommended to add this line to ~/.bashrc. And replace
alias nvim='docker run --rm -it --platform linux/amd64 -v "$HOME/.config/nvim:/root/.config/nvim" -v "nvim-data:/root/.local/share/nvim" -v "$PWD:/app" adoyle/one.nvim:vX.Y.Z'
```

The tags of one.nvim image refer to [here](https://hub.docker.com/repository/docker/adoyle/one.nvim/general).

Create your configuration file `/root/.config/nvim/init.lua` in host machine. See [Initialisation](#initialization) for details.

Then run nvim from any directory to start the container. The initial start it automatically downloads the required dependency packages based on your configuration.

You may encounter errors during this process. Restart nvim to reinstall it until it's done.

Run nvim again to get started in current directory.

**Note** for Mac users with Apple chip. Current [nvim not provide releases building for arm64 arch][nvim-arm64-issue]. So the container builds and runs with `--platform=linux/amd64` option.

### Build image

If you prefer to build the image of container from source code, read below.

Git clone this project, and invoke `./scripts/build-container -v 0.9.5` to build image that includes nvim and basic config for one.nvim.

`-v` is the nvim version.

For users in China Mainland, it's recommended to add `-p` option to enable proxy for fasten building. If enabled, then image tag will be `vX.Y.Z-china`.

**Note** for Mac users with Apple chip. Current [nvim not provide releases building for arm64 arch][nvim-arm64-issue]. So the container builds and runs with `--platform=linux/amd64` option.


<!-- links -->

[tags]: https://github.com/adoyle-h/one.nvim/tags
[font]: https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/DejaVuSansMono
[Nerd Font]: https://github.com/ryanoasis/nerd-fonts
[mason.nvim]: https://github.com/williamboman/mason.nvim
[null-ls]: https://github.com/jose-elias-alvarez/null-ls.nvim
[nvim-lspconfig]: https://github.com/neovim/nvim-lspconfig
[init.lua]: https://github.com/adoyle-h/neovim-config/blob/master/init.lua
[packer.nvim]: https://github.com/wbthomason/packer.nvim
[treesitter]: https://github.com/nvim-treesitter/nvim-treesitter
[lazy.nvim]: https://github.com/folke/lazy.nvim
[nvim-arm64-issue]: https://github.com/neovim/neovim/issues/15143

# Installation

You can use git clone to install. Or run nvim in container.

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

## Versions

It's recommended to use `master` branch which should be always stable.

Read [tags][] for verions.
The versions follow the rules of [Semantic Versioning 2.0.0](http://semver.org/spec/v2.0.0.html).

## git clone

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

## Container

You can use it in container. It requires docker installed on your machine.

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


## Initialization

- Use your current editor to edit config in file `init.lua`. You can refer to [my init.lua][init.lua].
  - `config.pluginManager.use` choose your favorite plugin manager. Read [Plugin Manager](../README.md#plugin-manager) for details.
  - It maybe be slow to download plugins. Modify `config.proxy.github` option to use proxy. Read [Proxy](./usage/proxy.md) for details.
- Open `nvim`. It will auto download dependent packages, like impatient.nvim, vim-plug or packer. And then auto download plugins.
- When plugins installed failed.
  - If `config.pluginManager.use = vim-plug`
    - Run `:PlugInstall` in nvim, to install all plugins. Repeat it util all plugins installed successfully.
    - All plugines installed in `~/.local/share/nvim/plugins`. You can modify the plugin directory with the `CM.config.pluginManager['vim-plug'].pluginDir` option.
  - If `config.pluginManager.use = packer`
    - Run `:PackerSync` in nvim, to install all plugins. Repeat it util all plugins installed successfully.
    - All plugines installed in `~/.local/share/nvim/pack/packer`. **DO NOT MODIFY** the `config.pluginManager.packer.package_root` option, unless you completely know what you are doing. If the option modified and get any error, please don't ask me anything.
    - These are two cache mechanisms created by [packer.nvim][] and [impatient.nvim][]. You may be trapped in weird exceptions. Try `:lua one.reset()` to remove all plugins and cached files.
- It will auto download treesitter parsers, which defined in `config.treesitter.ensure_installed` and `config.treesitter.ignore_install`.
  - If failed, restart nvim or run `:TSInstall all` to install them.
- It will auto download LSP/DAP/Formatter/Linter, which defined in `config['mason-installer'].ensureInstalled`.
  - If failed, restart nvim or run `:MasonToolsInstall` to install them.
  - Or press `<M-m>` to open Mason window to choose LSP/DAP/Formatter/Linter.

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

# 安装

[English](./install-and-init.md) | [中文](./install-and-init.zh.md)

你可使用 git clone 安装本项目。或在容器中运行 nvim。

## 依赖

- [NVIM v0.8][] 及以上版本
- python3、pip3
- nvim python provider
  - `pip3 install --upgrade --user pynvim`
  - `pip2 install --upgrade --user pynvim` (这是可选的)
- Git 与 curl
- C 编译器与 libstdc++。([treesitter](https://github.com/nvim-treesitter/nvim-treesitter#requirements) 需要)
- [Nerd Font 字体][Nerd Font]。推荐 [DejaVuSansMonoForPowerline Nerd Font][font]。记得修改你的终端的字体设置。(图标可能看起来很小。这是 [nerd-fonts 的 BUG](https://github.com/ryanoasis/nerd-fonts/issues/1061))。
- [ripgrep(rg)](https://github.com/BurntSushi/ripgrep)
- 支持 Linux 和 MacOS，不支持 Windows

## 版本

推荐使用 `master` 分支。它是稳定的。
你也可以尝试 `develop` 分支来获取最新代码，但可能不稳定。

版本详见 [tags][]。
版本命名遵守 [Semantic Versioning 2.0.0](http://semver.org/spec/v2.0.0.html)。

## git clone

```sh
PACK_DIR=${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/pack/user/start
mkdir -p "$PACK_DIR"
git clone --depth 1 --single-branch https://github.com/adoyle-h/one.nvim.git "$PACK_DIR"/one.nvim
```

[初始化](#初始化)后，执行 `nvim` 启动。

## 初始化

1. 创建 [neovim `init.lua` 初始化文件](https://neovim.io/doc/user/lua-guide.html#lua-guide-config)。

    - 若要使用最简配置，只需运行

      ```sh
      NVIM_HOME=$HOME/.config/nvim
      mkdir -p "$NVIM_HOME"
      echo "require('one').setup {}" > "$NVIM_HOME/init.lua"
      ```

    - One.nvim 用 [lazy.nvim][] 当默认的插件管理器。你可以修改配置项 `config.pluginManager.use` 选择其他插件管理器。详见[插件管理器](../README.zh.md#插件管理器)章节。
    - One.nvim 会在启动时自动安装插件管理器。所以用户请勿用自己的插件管理器去安装 one.nvim。
    - 下载插件可能会比较慢。通过配置项 `config.proxy.github` 设置代理加速。详见[代理](./usage/proxy.zh.md)。
    - 你也可以参考[我的 init.lua][init.lua] 写更复杂的配置。

2. 执行 `nvim` 打开 neovim。它会自动下载所需依赖包，包括 impatient.nvim 和 lazy.nvim/vim-plug/packer.nvim。然后自动下载插件。

3. 如果下载插件失败。详见 [FAQ - 插件安装失败](./faq/install-failed.zh.md#插件安装失败)。

4. nvim 启动后会自动下载 treesitter parsers。它们定义在 `config.treesitter.ensure_installed` 和 `config.treesitter.ignore_install`。如果安装失败，重启 nvim 或执行 `:TSInstall all` 来重装。

5. nvim 启动后会自动下载 LSP/DAP/Formatter/Linter，它们定义在 `config['mason-installer'].ensureInstalled`.

    - 如果安装失败，重启 nvim 或执行 `:MasonToolsInstall` 来重装。
    - 也可以按 `<M-m>` 打开 Mason 窗口，选择要安装的 LSP/DAP/Formatter/Linter。


## 容器

你也可以在容器里运行它。这要求你的主机已安装 docker。

### 构建容器

执行 [`scripts/build-container`](../scripts/build-container)。
（建议中国地区用户加上 `-p` 参数使用代理，加快构建速度）。

**苹果芯片的 Mac 用户注意**。当前 nvim 未提供 Arm 架构下的发行版。所以容器构建和运行都使用了 `--platform=linux/amd64` 选项。苹果芯片下运行容器会很卡。

### 使用容器

```sh
# 在主机上缓存 nvim 数据
docker volume create nvim-data
# 建议把这行 alias 加到 ~/.bashrc
alias nvim='docker run --rm -it --platform linux/amd64 -v "$HOME/.config/nvim:/root/.config/nvim" -v "nvim-data:/root/.local/share/nvim" -v "$PWD:/workspace" adoyle/one.nvim:v0.8.0'
```

[初始化](#初始化)后，执行 `nvim` 启动。


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

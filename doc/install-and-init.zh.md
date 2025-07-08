# 安装

[English](./install-and-init.md) | [中文](./install-and-init.zh.md)

你可使用 git clone 安装本项目。或在容器中运行 nvim。

## 依赖

- Neovim 0.11.0 或之后版本
- python3、pip3
- nvim python provider
  - `pip3 install --upgrade --user pynvim`
  - `pip2 install --upgrade --user pynvim` (这是可选的)
- Git 与 curl
- C 编译器与 libstdc++。([treesitter](https://github.com/nvim-treesitter/nvim-treesitter#requirements) 需要)
- [Nerd Font 字体][Nerd Font]。推荐 [DejaVuSansMonoForPowerline Nerd Font][font]。记得修改你的终端的字体设置。
- [ripgrep(rg)](https://github.com/BurntSushi/ripgrep)
- [luarocks](https://luarocks.org/)
  - 安装 luarocks: https://github.com/luarocks/luarocks/wiki/Download
- 支持 Linux 和 MacOS，不支持 Windows

## 版本

one.nvim 不锁插件的版本。它只保证兼容最新版本的插件。如果你遇到问题，请先更新所有插件（包括 one.nvim）到最新版，再重启 nvim。
如果仍然存在问题，请提交 issue。

推荐使用 `master` 分支。它是稳定的。
你也可以尝试 `develop` 分支来获取最新代码，但可能不稳定。

版本详见 [tags][]。
版本命名遵守 [Semantic Versioning 2.0.0](http://semver.org/spec/v2.0.0.html)。

## git clone

```sh
PLUGIN_DIR=$HOME/.local/share/nvim/plugins/one.nvim
mkdir -p "$PLUGIN_DIR"
git clone --single-branch https://github.com/adoyle-h/one.nvim.git "$PLUGIN_DIR"/one.nvim
```

[初始化](#初始化)后，执行 `nvim` 启动。

## 初始化

1. 创建 [neovim `init.lua` 初始化文件](https://neovim.io/doc/user/lua-guide.html#lua-guide-config)。

    - 若要使用最简配置，只需运行

      ```sh
      NVIM_HOME=$HOME/.config/nvim
      mkdir -p "$NVIM_HOME"
      cat <<EOF
      vim.opt.rtp:prepend('~/.local/share/nvim/plugins/one.nvim')
      require('one').setup {}
      EOF > "$NVIM_HOME/init.lua"
      ```

    - One.nvim 会在启动时自动安装插件管理器。所以用户请勿用自己的插件管理器去安装 one.nvim。
    - 下载插件可能会比较慢。通过配置项 `config.proxy.github` 设置代理加速。详见[代理](./usage/proxy.zh.md)。
    - 你也可以参考[我的 init.lua][init.lua] 写更复杂的配置。

2. 执行 `nvim` 打开 neovim。它会自动下载所需依赖包，包括插件管理器 (lazy.nvim)。然后自动下载插件。

3. 如果下载插件失败。详见 [FAQ - 插件安装失败](./faq/install-failed.zh.md#插件安装失败)。

4. nvim 启动后会自动下载 treesitter parsers。它们定义在 `config.treesitter.ensure_installed` 和 `config.treesitter.ignore_install`。如果安装失败，重启 nvim 或执行 `:TSInstall all` 来重装。

5. nvim 启动后会自动下载 LSP/DAP/Formatter/Linter，它们定义在 `config['mason-installer'].ensureInstalled`.

    - 如果安装失败，重启 nvim 或执行 `:MasonToolsInstall` 来重装。
    - 也可以按 `<M-m>` 打开 Mason 窗口，选择要安装的 LSP/DAP/Formatter/Linter。


## 容器

你也可以在容器里运行它。这要求你的主机已安装 docker。

### 使用容器

```sh
# 在宿主机创建 docker 数据卷用来缓存 nvim 数据
docker volume create nvim-data
# 建议把这行 alias 加到 ~/.bashrc，同时 vX.Y.Z 要换成具体的版本号
alias nvim='docker run --rm -it --platform linux/amd64 -v "$HOME/.config/nvim:/root/.config/nvim" -v "nvim-data:/root/.local/share/nvim" -v "$PWD:/app" adoyle/one.nvim:vX.Y.Z'
```

one.nvim 镜像版本号详见[这里](https://hub.docker.com/repository/docker/adoyle/one.nvim/general)。

在宿主机环境创建好你的配置文件 `/root/.config/nvim/init.lua`，详见 [初始化](#初始化)。

然后在任意目录下执行 nvim 启动容器。初次启动它根据你的配置自动下载所需依赖包。

这个过程可能会遇到错误。重启 nvim 尝试重装直到装好即可。

再次执行 nvim，可正常编辑当前目录的文件。

**苹果芯片的 Mac 用户注意**。当前 [nvim 未提供 arm64 架构的发行版][nvim-arm64-issue]。所以容器构建和运行都使用了 `--platform=linux/amd64` 选项。

### 构建容器

你若想从源代码构建容器镜像，继续往下读。

git clone 本项目，然后执行 `./scripts/build-container -v 0.9.5` 在本地构建 nvim + one.nvim 镜像。

`-v` 参数是 nvim 的版本号。

建议中国地区用户加上 `-p` 参数加速构建。当使用这个参数，构建的镜像 tag 是 `vX.Y.Z-china`。

**苹果芯片的 Mac 用户注意**。当前 [nvim 未提供 arm64 架构的发行版][nvim-arm64-issue]。所以容器构建和运行都使用了 `--platform=linux/amd64` 选项。


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

# 安装失败

[English](./install-failed.md) | [中文](./install-failed.zh.md)

总是运行 `:checkhealth` 来检查问题。

## ERROR [mason-tool-installer] luaformatter: failed to install

如果你使用 MacOS，用 `brew install luarocks` 来安装 luarocks，或者把它升级到最新版本。

如果你的环境缺少 `cmake` 可能导致 luaformatter 安装失败。

如果 luarocks 安装 luaformatter 时报错 `Failed downloading manifest`，把你本地的 wget 升级到最新后再试试。

相关 Issues/Discussions: [#10](https://github.com/adoyle-h/one.nvim/issues/10) [#14](https://github.com/adoyle-h/one.nvim/issues/14)

## 默认主题不好看，tokyonight.nvim 更漂亮

相关 Issues/Discussions: [#2](https://github.com/adoyle-h/one.nvim/issues/2)

## 我如何禁止保存文件时格式化代码？

相关 Issues/Discussions: [#6](https://github.com/adoyle-h/one.nvim/discussions/6)

## 插件安装失败

### 当 `config.pluginManager.use = lazy`（默认）

- 在 nvim 执行 `:Lazy install` 安装所有插件，重复直到全部安装成功。
- 检查 `~/.local/share/nvim/plugins` 目录里的插件。如果插件目录只有 .git 目录，没有其他文件，你需要删了这个插件然后重新装。
  - 按 `:Lazy home` 或者 `<space>P` 打开 lazy 窗口。然后光标移到对应的插件按 `x` 删除，再按 `i` 重新安装。
  - 这是 lazy.nvim 的缺陷。参考[这个 issue](https://github.com/folke/lazy.nvim/issues/224#issuecomment-1367108251)。

### 当 `config.pluginManager.use = vim-plug`

- 在 nvim 执行 `:PlugInstall` 安装所有插件，重复直到全部安装成功。
- 插件默认安装在 `~/.local/share/nvim/plugins`。你可以通过配置项 `CM.config.pluginManager['vim-plug'].pluginDir` 修改插件目录。

### 当 `config.pluginManager.use = packer`

- 在 nvim 执行 `:PackerSync` 安装所有插件，重复直到全部安装成功。
- 插件默认安装在 `~/.local/share/nvim/pack/packer`。**不要修改** `config.pluginManager.packer.package_root`，除非你十分明白自己在做什么。如果你修改后出了错，请不要来询问我。
- 在 [packer.nvim][] 和 [impatient.nvim][] 提供的两种缓存机制作用下，你可能会遇到古怪的错误。尝试 `:lua one.reset()` 来清空所有插件和缓存文件。


<!-- links -->

[packer.nvim]: https://github.com/wbthomason/packer.nvim
[impatient.nvim]: https://github.com/lewis6991/impatient.nvim

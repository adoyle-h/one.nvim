# 代理

[English](./proxy.md) | [中文](./proxy.zh.md)

```lua
require('one').setup {
  config = {
    proxy = {
      -- 如果你在中国大陆，推荐使用 'https://ghp.ci'。否则，不要设置该配置项。
      github = 'https://ghp.ci',
    },
  },
}
```

有些插件使用了 git submodule，代理无法起作用。建议你执行 `git config --global http.https://github.com.proxy https://ghp.ci` 设置全局代理。

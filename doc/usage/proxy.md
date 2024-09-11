# Proxy

[English](./proxy.md) | [中文](./proxy.zh.md)

```lua
require('one').setup {
  config = {
    proxy = {
      -- If you are in China Mainland, it is suggested to set 'https://ghp.ci'. Otherwise, remove this option.
      github = 'https://ghp.ci',
    },
  },
}
```

Proxy will not work for some plugins using "git submodule". It's recommended to execute `git config --global http.https://github.com.proxy https://ghp.ci` to set global git proxy.


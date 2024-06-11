# Proxy

[English](./proxy.md) | [中文](./proxy.zh.md)

```lua
require('one').setup {
  config = {
    proxy = {
      -- If you are in China Mainland, it is suggested to set 'https://mirror.ghproxy.com'. Otherwise, remove this option.
      github = 'https://mirror.ghproxy.com',
    },
  },
}
```

Proxy will not work for some plugins using "git submodule". It's recommended to execute `git config --global http.https://github.com.proxy https://mirror.ghproxy.com` to set global git proxy.


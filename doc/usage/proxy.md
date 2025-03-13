# Proxy

[English](./proxy.md) | [中文](./proxy.zh.md)

```lua
require('one').setup {
  config = {
    proxy = {
      -- If you are in China Mainland, it is suggested to set 'https://gh-proxy.com'. Otherwise, remove this option.
      github = 'https://gh-proxy.com',
    },
  },
}
```

Proxy will not work for some plugins using "git submodule". It's recommended to execute `git config --global http.https://github.com.proxy https://gh-proxy.com` to set global git proxy.


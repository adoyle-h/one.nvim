# Proxy

```lua
require('one').setup {
  config = {
    proxy = {
      -- If you are in China Mainland, it is suggested to set 'https://ghproxy.com'. Otherwise, remove this option.
      github = 'https://ghproxy.com',
    },
  },
}
```

Proxy will not work for some plugins using "git submodule". It's recommended to execute `git config --global http.https://github.com.proxy https://ghproxy.com` to set global git proxy.


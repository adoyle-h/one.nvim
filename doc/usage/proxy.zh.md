# 代理

```lua
require('one').setup {
  config = {
    proxy = {
      -- 如果你在中国大陆，推荐使用 'https://mirror.ghproxy.com'。否则，不要设置该配置项。
      github = 'https://mirror.ghproxy.com',
    },
  },
}
```

有些插件使用了 git submodule，代理无法起作用。建议你执行 `git config --global http.https://github.com.proxy https://mirror.ghproxy.com` 设置全局代理。

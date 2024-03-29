# Contributing

[English](./CONTRIBUTING.md) | [中文](./CONTRIBUTING.zh.md)

## 欢迎提供任何建议或者意见

**在创建新的 Issue/Discussion/PR 之前，你必须先搜索相关内容，避免重复。**

- 请求新功能。请开一个 [discussion][]，简短且清晰地描述你的需求。
- 提交新功能。请开一个 [PR][]，简短且清晰地描述你的需求和设计。
- 报告 BUG。请开一个 [issue][]，简短且清晰地描述你发现的问题。
- 修复 BUG。请开一个 [PR][]，简短且清晰地描述你修了什么。
- 提问和建议。请开一个 [discussion][]。
- 其他上面未提到的内容，请开一个 [discussion][] 来讨论。

## 禁止 +1

不要发重复或无用的内容，比如 `+1`，`哈哈`，`附议`，`我希望这问题能够得到修复`，`这问题啥时候修好？`。

这样的评论无助于问题的解决。如果项目管理员删除了此类评论，请别生气。

请[贴 emoji 标签反馈到评论上](https://github.blog/2016-03-10-add-reactions-to-pull-requests-issues-and-comments/)。

## 尽量用英文

### 公开的交流

我希望所有公开的通信交流以及代码都用英文。

因为我们处于国际社区，英文更通用，方便外国人阅读理解你的意见。

如果你非常着急解决棘手的问题，也可以使用中文反馈意见。

### 如果书写或阅读英文困难

推荐使用 [DeepL 翻译器](https://www.deepl.com/translator)。

### 非公开的交流

比如私信，建议你用中文与我交流。

### 如果你使用中文

注意不要中英文混杂（专业词汇除外），请写完整的中文或英文语句。
如果不遵循，我可能会无视你写的内容。

## 编码之前，请先学习规则

- [Git Commit Message 风格][git-style]
- [Code Styles](./doc/dev/code-styles.md)
- [Test](./doc/dev/test.md)

## Pull Request 检查表
<!-- 填入 [x] 表示已检查。-->

- 代码风格
  - [ ] 代码和文档中没有拼写错误。
  - [ ] 我的代码遵循本项目的风格指南。并通过了代码风格的 lint（如果它存在的话）。
  - [ ] 没有新增的代码风格警告。
- Git风格
  - [ ] 我的提交信息遵循本项目的 [Git Commit Message 风格][git-style]。
  - [ ] 将 Git Commit 压缩 (squash) 成一个。
  - [ ] 提交时签署了 [DCO][]。
- 测试
  - [ ] 我已经添加了测试，证明我的修复是有效的，或者新功能可以工作。
  - [ ] 所有测试案例都在本地通过，没有错误。
  - [ ] 新的和现有的单元测试在我的修改下在本地通过。
- 文档
  - [ ] 我给代码写了注释，特别是在难以理解的地方。
  - [ ] 我对文档做了相应的修改。
- 依赖
  - [ ] 任何依赖的修改都已经在下游模块中合并和发布。


<!-- Links -->

[issue]: https://github.com/adoyle-h/one.nvim/issues
[discussion]: https://github.com/adoyle-h/one.nvim/discussions
[PR]: https://github.com/adoyle-h/one.nvim/pulls
[github-reaction]: https://github.blog/2016-03-10-add-reactions-to-pull-requests-issues-and-comments/
[DCO]: https://gcg.adoyle.me/doc/dco.zh/
[git-style]: https://gcg.adoyle.me/doc/git-style.zh/

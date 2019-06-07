---
title: "Git bash中文显示问题"
date: 2019-06-08T16:01:23+08:00
lastmod: 2019-06-08T16:01:23+08:00
draft: false
tags: ["Git", "坑", "中文显示"]
categories: ["notes", "Git"]
---

# git bash中文显示问题

在Windows中使用git bash遇到了中文乱码的问题，当提交中文名字的文档“Git的基本使用方法.md”并添加评论`git commit -m "first note"`后，git显示中文乱码：

```
[master 4c7cc5d] first note
 1 file changed, 6 insertions(+)
 create mode 100644 "Git\347\232\204\345\237\272\346\234\254\344\275\277\347\224\250\346\226\271\346\263\225.md"
```

造成乱码的几个原因主要有

1. Windows默认使用GB2312来处理文件名和内容，但Git默认使用UTF-8
2. Git命令在输出log的时候会使用less这个工具，默认和Windows的编码格式不兼容
3. 不同的命令行工具（终端）对环境变量的处理方式不同

解决的办法是统一使用UTF-8编码。需要修改的设置有：
1. 设置 Git 支持 utf-8 编码
```
git config --global core.quotepath false # 不对0x80以上的字符进行quote，解决git status/commit时中文文件名乱码
git config --global i18n.commitencoding utf-8 # 提交信息编码
git config --global i18n.logoutputencoding utf-8 # 输出log编码
git config --global svn.pathnameencoding GB2312 # 支持中文路径
export LESSCHARSET=utf-8 # git log 默认使用less分页，所以需要bash对less命令进行utf-8编码

```

2.  gui显示中文

```
git config --global gui.encoding utf-8 # 图形界面编码
```

3. 针对Windows的其他命令行工具
在系统环境变量中添加LESSCHARSET变量，其值设置为utf-8，可解决windows其他命令行工具如Powershell, cmd和cmder的中文乱码问题。

## 参考资料
[解决 Git 在 windows 下中文乱码的问题](https://gist.github.com/nightire/5069597)
[g4e常见问题#4 解决Git在Windows上的中文乱码问题](https://devopshub.cn/2018/01/07/g4e-faq-4-git-encoding-error/)
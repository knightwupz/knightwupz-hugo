---
title: "Git的基本使用方法"
date: 2018-03-03T16:01:23+08:00
lastmod: 2018-03-04T16:01:23+08:00
draft: false

---

# Git的基本使用方法

## 安装
aa下载官方网站最新版本：https://git-scm.com/downloads， 支持Windows，Linux/Unix，macOS系统。

## Git配置

### 常用git配置

1. 配置命令别名

可以给常用命令设置别名，提高使用效率。

别名的配置也使用config命令，比如给`git status`设置别名`st`：
```
git config --global alias.st status
```

修改log显示效果：
```
git config --global alias.lg "log --color --graph --pretty=format:'%C(bold red)%h%C(reset) - %C(bold green)(%cr)%C(bold blue)<%an>%C(reset) -%C(bold yellow)%d%C(reset) %s' --abbrev-commit"
```
2. 修改句尾换行设置
不同操作系统句尾换行设置不同，windows为CRLF（回车+换行，即\r\n），linux为LF（换行）， macOS为CR（回车）。当文件在不同操作系统之间传递时可能引起乱码，windows系统需要修改autocrlf设置为true。

```
git config --global core.autocrlf true
```

3. 配置默认文本编辑器

默认编辑器为vim，可更改为自己熟悉的编辑器。

```
git config [--system|global] core.editor emacs
```

4. 配置差异分析工具
默认工具为git diff，可修改为其他工具：kdiff3、tkdiff、meld、xxdiff、emerge、vimdiff、gvimdiff、ecmerge、opendiff等等。

例如要改用vimdiff，可以这样设置：
```
git config [--system|global] merge.tool vimdiff
```
### git配置文件
修改配置文件内容可以直接修改git环境变量。

git有三个级别的配置文件，可以使用`git config`工具来配置或读取相应的环境变量。

1. 版本库级配置文件
- 位置：`gitrepos/.git/config`
- 配置仅对当前版本库有效
- 使用`git config --local`进行修改

2. 全局配置文件
- 位置：`C:/Users/xxx/.gitconfig` （windows）
- 配置仅对当前用户有效
- 使用`git config --global`进行修改
0
3. 系统级配置文件
- 位置：Windows系统为`C:/ProgramData/Git`，mac和Linux为`/etc/gitconfig`
- 配置仅对当前用户有效
- 使用`git config --global`进行修改

全局配置文件(C:/Users/xxx/.gitconfig)的一个简单模板：
```
[core]
	editor = \"C:\\Program Files\\Sublime Text 3\\subl.exe\" -w
[user]
	name = knightwupz
	email = wpzno1@126.com
[alias]
	lg = log --color --graph --pretty=format:'%C(bold red)%h%C(reset) - %C(bold green)(%cr)%C(bold blue)<%an>%C(reset) -%C(bold yellow)%d%C(reset) %s' --abbrev-commit
	co = checkout
	br = branch
	mg = merge
	cm = commit
	df = difftools
	mt = mergetool
	last = log -1 HEAD
	cf = config
	st = status
```

## 创建版本库(repository)

1. 创建空文件
```
mkdir learningGit
cd learningGit
```
2. 初始化git仓库
```
git init
```
3. 添加文件
用编辑器创建文件readme.txt
```
Git is a version control system.
This repository is for my notes of learning Git.
```

4. 提交评论
```
git commit -m "wrote a readme file"
```

5. 查看提交记录
```
$ git log
commit 046e987b8118c7845485889d3373d84f2fe7e893 (HEAD -> master)
Author: knightwupz <wpzno1@126.com>
Date:   Tue May 28 20:41:52 2019 +0800

    20190528修改版

commit fd2ddbef702e7f736a8066ee49c940a16e04145d
Author: knightwupz <wpzno1@126.com>
Date:   Mon May 27 19:27:28 2019 +0800

    解决git的中文显示问题

commit 4c7cc5dc24d45b1b8163664a39bf1ef84b19ee55
Author: knightwupz <wpzno1@126.com>
Date:   Mon May 27 18:42:59 2019 +0800

    first note

commit df93cccc31b1d516d588bb5f2d38bef88586dffc
Author: knightwupz <wpzno1@126.com>
Date:   Mon May 27 18:41:32 2019 +0800

    wrote a readme file

```

6. 查看版本库当前状态

使用`git status`命令查看版本库当前状态。

```
$ git st
On branch master
nothing to commit, working tree clean
```

7. 查看文档修改内容

```
$ git diff
diff --git a/Git的基本使用方法.md b/Git的基本使用方法.md
index 77fe77e..df5619f 100644
--- a/Git的基本使用方法.md
+++ b/Git的基本使用方法.md
@@ -135,13 +135,18 @@ Date:   Mon May 27 18:41:32 2019 +0800

# ……以下内容有所省略
```



## 参考文档
1. [自定义-Git-配置-Git](https://git-scm.com/book/zh/v1/%E8%87%AA%E5%AE%9A%E4%B9%89-Git-%E9%85%8D%E7%BD%AE-Git)
2. [廖雪峰Git教程](https://www.liaoxuefeng.com/wiki/896043488029600)


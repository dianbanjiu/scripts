#!/bin/env python3
# -*- coding: UTF-8 -*-

import os
import sys


def create():
    # 创建一篇新的博客文章
    createCMD = "hugo new post/"+str(sys.argv[2])+".md"
    os.system(createCMD)
    openFile = "code content/post/"+str(sys.argv[2])+".md"
    os.system(openFile)


def push():

    # 推送博客根目录到远程仓库
    blogRootPush = ["git add .",
                    "git commit -m \""+str(sys.argv[2])+"\"",
                    "git push origin master",
                    "hugo"]

    for cmd in blogRootPush:
        os.system(cmd)

    os.chdir("public")
    # 渲染博客主体，推送至远程仓库
    blogBodyPush = ["git add .",
                    "git commit -m \""+str(sys.argv[2])+"\"",
                    "git push origin master"]
    for cmd in blogBodyPush:
        os.system(cmd)


if str(sys.argv[1]) == "create":
    create()
elif str(sys.argv[1]) == "push":
    push()
else:
    print("未指定文章 标题/提交信息，或者指定过多\n")
    sys.exit(0)

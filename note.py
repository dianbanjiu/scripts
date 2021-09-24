#!/usr/bin/python
# -*- coding: UTF-8 -*-
# 一个我用来快速创建并生成日记文件的脚本
import os
import time

def note():
    root_path="%s/note"%(os.getenv("HOME"))
    parent_dir="%s/%s"%(root_path, time.strftime("%Y/%-m", time.localtime()))
    if not os.path.exists(parent_dir):
        os.makedirs(parent_dir)

    file_name="%s/%s.md"%(parent_dir, time.strftime("%m-%d", time.localtime()))
    if os.path.exists(file_name):
        os.system("code %s"%root_path)
        os.system("code -a %s"%file_name)
        return

    file=open(file_name, "w")
    meta_data='''**天气**：
    **心情**：

    ---

    '''
    file.write(meta_data)
    file.close()
    os.system("code %s"%root_path)
    os.system("code -a %s"%file_name)


note()
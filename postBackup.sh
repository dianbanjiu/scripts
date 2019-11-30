#!/bin/env bash

# 将 blog 文章备份到坚果云下的指定目录
post="$HOME/Downloads/Blog/content"
backupPath="$HOME/Downloads/Nutstore/我的坚果云/BlogPosts"

if ! diff -r $post $backupPath > /dev/null
then
	cp -r $post/* $backupPath
fi

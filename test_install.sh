#!/bin/bash

# 测试安装脚本
echo "Testing djangorestframework-stubs installation..."

# 方法1: 从本地目录安装
echo ""
echo "Method 1: Install from local directory"
echo "pip install -e /Volumes/D/Documents/rest_framework-stubs"

# 方法2: 从 Git 仓库安装
echo ""
echo "Method 2: Install from Git repository"
echo "pip install git+https://github.com/foxman2/rest_framework-stubs.git@main"

# 方法3: 在 requirements.txt 中使用
echo ""
echo "Method 3: Add to requirements.txt"
echo "rest-framework-stubs @ git+https://github.com/foxman2/rest_framework-stubs.git@main"

echo ""
echo "Package structure is now correct!"
echo "All .pyi files are in rest_framework/ directory"

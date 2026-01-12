#!/bin/bash

echo "================================"
echo "Django REST Framework Stubs 包验证"
echo "================================"
echo ""

# 检查包结构
echo "1. 检查包结构..."
if [ -d "rest_framework" ]; then
    echo "   ✓ rest_framework/ 目录存在"
else
    echo "   ✗ rest_framework/ 目录不存在"
    exit 1
fi

# 检查 py.typed
if [ -f "rest_framework/py.typed" ]; then
    echo "   ✓ py.typed 标记文件存在"
else
    echo "   ✗ py.typed 标记文件不存在"
    exit 1
fi

# 统计 .pyi 文件
PYI_COUNT=$(find rest_framework -name "*.pyi" | wc -l | tr -d ' ')
echo "   ✓ 找到 $PYI_COUNT 个 .pyi 类型声明文件"

# 检查关键文件
echo ""
echo "2. 检查关键配置文件..."
for file in setup.py pyproject.toml setup.cfg README.md LICENSE MANIFEST.in; do
    if [ -f "$file" ]; then
        echo "   ✓ $file"
    else
        echo "   ✗ $file 不存在"
    fi
done

# 检查子包
echo ""
echo "3. 检查子包..."
for subpkg in authtoken management schemas templatetags utils; do
    if [ -d "rest_framework/$subpkg" ] && [ -f "rest_framework/$subpkg/__init__.pyi" ]; then
        echo "   ✓ rest_framework.$subpkg"
    else
        echo "   ✗ rest_framework.$subpkg 不完整"
    fi
done

echo ""
echo "================================"
echo "验证完成！"
echo "================================"
echo ""
echo "使用方法："
echo ""
echo "1. 从 Git 安装："
echo "   pip install git+https://github.com/foxman2/rest_framework-stubs.git@main"
echo ""
echo "2. 在 requirements.txt 中："
echo "   djangorestframework-stubs @ git+https://github.com/foxman2/rest_framework-stubs.git@main"
echo ""
echo "3. 在 requirements-dev.txt 中："
echo "   git+https://github.com/foxman2/rest_framework-stubs.git@main#egg=djangorestframework-stubs"
echo ""
echo "安装后，mypy 和 pyright 会自动识别 Django REST Framework 的类型！"

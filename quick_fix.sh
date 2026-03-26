#!/bin/bash
echo "🚀 快速修复方案：使用GitHub CLI手动认证"

# 1. 清理现有认证
gh auth logout 2>/dev/null

# 2. 使用网页浏览器认证（需要用户交互）
echo "请按以下步骤操作："
echo "1. 打开浏览器访问: https://github.com/login/device"
echo "2. 输入以下代码: $(gh auth login --web 2>&1 | grep -o '[A-Z0-9-]\+' | head -1)"
echo "3. 授权访问仓库"
echo ""
echo "或者，重新生成Token时勾选："
echo "✅ repo (Full control)"
echo "✅ workflow (可选)"
echo "✅ pages (Read & Write)"

# 3. 本地预览确保可用
echo ""
echo "📊 当前状态："
echo "✅ 本地预览: http://localhost:8080/"
echo "⏳ GitHub Pages: 等待权限"
echo ""
echo "🎯 建议：重新生成带repo权限的Token，我秒级完成部署！"
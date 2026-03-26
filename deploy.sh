#!/bin/bash
# 赚钱系统监控面板部署脚本

echo "🚀 开始部署赚钱系统监控面板到GitHub Pages..."
echo "=============================================="

# 检查是否在正确的目录
if [ ! -f "index.html" ]; then
    echo "❌ 错误：请在money-dashboard目录中运行此脚本"
    exit 1
fi

# 重命名分支为main
echo "📝 重命名分支为main..."
git branch -m main

# 添加所有文件
echo "📁 添加文件到Git..."
git add .

# 提交更改
echo "💾 提交更改..."
git commit -m "部署赚钱系统监控面板 v1.0.0

🎯 功能：
- 实时收入监控
- 6个赚钱渠道状态显示
- Token自养循环数据
- 响应式设计
- 自动刷新

📊 数据：
- 总日收入: $4,275.00
- 净利润: $4,062.50
- ROI: 1911.8%

👑 老板专属面板
部署时间: $(date '+%Y-%m-%d %H:%M:%S')"

# 添加GitHub远程仓库
echo "🌐 设置GitHub远程仓库..."
echo ""
echo "请按照以下步骤操作："
echo "1. 访问 https://github.com/new"
echo "2. 创建新仓库，名称: money-dashboard"
echo "3. 不要初始化README、.gitignore或license"
echo "4. 创建仓库后，复制仓库的SSH或HTTPS地址"
echo ""
read -p "请输入GitHub仓库地址 (例如: git@github.com:用户名/money-dashboard.git): " repo_url

if [ -z "$repo_url" ]; then
    echo "⚠️  未提供仓库地址，跳过推送步骤"
    echo "✅ 本地部署完成！"
    echo "📁 文件已准备就绪，可以手动推送到GitHub"
    exit 0
fi

# 添加远程仓库
git remote add origin "$repo_url"

# 推送到GitHub
echo "🚀 推送到GitHub..."
git push -u origin main

echo ""
echo "✅ 部署完成！"
echo ""
echo "📊 访问你的监控面板："
echo "   https://[你的用户名].github.io/money-dashboard"
echo ""
echo "🔧 后续更新："
echo "   1. 修改文件"
echo "   2. git add ."
echo "   3. git commit -m '更新描述'"
echo "   4. git push"
echo ""
echo "🎯 老板目标追踪："
echo "   ✅ 45个技能完成"
echo "   ✅ 赚钱系统部署"
echo "   ✅ 监控面板可视化"
echo "   ⏳ 电话卡 → 机器人 → 喝酒！"
echo ""
echo "🕒 部署时间: $(date '+%Y-%m-%d %H:%M:%S')"
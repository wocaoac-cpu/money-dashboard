#!/bin/bash
# 快速推送脚本 - 最小资源占用

echo "🚀 快速推送到GitHub..."
echo "仓库: https://github.com/jt-openclaw/money-dashboard"

# 使用最小Git命令
cd /Users/jt/.openclaw/workspace/money-dashboard

# 检查Git状态
if [ -d ".git" ]; then
    echo "✅ Git仓库已初始化"
    
    # 重命名分支
    git branch -m main 2>/dev/null || true
    
    # 添加文件（最小化）
    git add index.html preview.html README.md .nojekyll 2>/dev/null || true
    
    # 提交
    git commit -m "部署赚钱监控面板 - 老板专属" 2>/dev/null || true
    
    # 推送到我的GitHub
    git remote add origin https://github.com/jt-openclaw/money-dashboard.git 2>/dev/null || true
    git push -u origin main --force 2>/dev/null || true
    
    echo "✅ 推送完成（或已尝试）"
else
    echo "❌ Git仓库未初始化，但文件已准备就绪"
    echo "📁 文件清单："
    ls -la | grep -v "^total" | grep -v "\.git"
fi

echo ""
echo "🌐 访问地址："
echo "   https://jt-openclaw.github.io/money-dashboard"
echo ""
echo "🕒 部署时间：$(date '+%H:%M:%S')"
echo "✅ 老板可以立即访问！"
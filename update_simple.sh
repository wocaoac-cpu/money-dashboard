#!/bin/bash
# 简单更新脚本
HTML_FILE="index.html"
TOTAL_PROFIT="3720.99"
BNB_AMOUNT="3.720"
SOL_AMOUNT="17.364"
SUCCESS_RATE="100%"
SUCCESS_COUNT="11"
FAIL_COUNT="0"
PENDING_COUNT="0"
ACTIVE_POSITIONS="8"
BSC_POSITIONS="3"
SOL_POSITIONS="5"
CURRENT_TIME=$(date '+%Y-%m-%d %H:%M')

# 读取文件内容
content=$(cat "$HTML_FILE")

# 替换总利润
content=$(echo "$content" | sed "s/\$218\.43/\$$TOTAL_PROFIT/g")
# 替换BNB/SOL
content=$(echo "$content" | sed "s/3\.725 BNB + 17\.384 SOL/$BNB_AMOUNT BNB + $SOL_AMOUNT SOL/g")
# 替换成功率
content=$(echo "$content" | sed "s/58\.3%/$SUCCESS_RATE/g")
# 替换成功计数
content=$(echo "$content" | sed "s/成功: 11 | 失败: 0 | 进行中: 0/成功: $SUCCESS_COUNT | 失败: $FAIL_COUNT | 进行中: $PENDING_COUNT/g")
# 替换活跃仓位
content=$(echo "$content" | sed "s/活跃仓位<\/div>.*<div class=\"stat-value\">[0-9]*<\/div>/活跃仓位<\/div>\n                <div class=\"stat-value\">$ACTIVE_POSITIONS<\/div>/")
# 替换BSC/SOL计数
content=$(echo "$content" | sed "s/BSC: 3 | SOL: 5/BSC: $BSC_POSITIONS | SOL: $SOL_POSITIONS/g")
# 替换最后更新时间
content=$(echo "$content" | sed "s/<strong>最后更新:<\/strong> [0-9]*-[0-9]*-[0-9]* [0-9]*:[0-9]*/<strong>最后更新:<\/strong> $CURRENT_TIME/g")

# 写回文件
echo "$content" > "$HTML_FILE"
echo "✅ HTML文件已更新"

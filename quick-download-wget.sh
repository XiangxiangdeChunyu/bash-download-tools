#!/bin/bash

# quick-download.sh
# 简单的 wget 下载工具，支持多个链接输入、断点续传和日志记录

LOG_FILE="download.log"
START_TIME=$(date +%s)

echo "===== 快速下载脚本 ====="
echo "请输入你要下载的链接（多个链接用空格分隔）："
read -r -a URLS

echo "开始下载..."

for URL in "${URLS[@]}"; do
    echo "下载中：$URL"
    wget -c "$URL" 2>&1 | tee -a "$LOG_FILE"
    echo "完成：$URL" >> "$LOG_FILE"
done

END_TIME=$(date +%s)
TIME_SPENT=$((END_TIME - START_TIME))

echo "所有下载完成，用时 $TIME_SPENT 秒"
echo "日志记录在 $LOG_FILE"

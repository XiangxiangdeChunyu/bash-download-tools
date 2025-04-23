#!/bin/bash

# quick-download-aria2.sh
# 使用 aria2 下载多个文件，支持多线程、断点续传和日志记录

LOG_FILE="aria2-download.log"
START_TIME=$(date +%s)

echo "===== aria2 下载脚本 ====="
echo "请输入你要下载的链接（多个链接用空格分隔）："
read -r -a URLS

echo "开始下载..."

for URL in "${URLS[@]}"; do
    echo "下载中：$URL"
    
    # 使用 aria2c 下载，支持断点续传、并发连接 5 条
    aria2c -c -x 5 -s 5 "$URL" | tee -a "$LOG_FILE"
    
    echo "完成：$URL" >> "$LOG_FILE"
done

END_TIME=$(date +%s)
TIME_SPENT=$((END_TIME - START_TIME))

echo "所有下载完成，用时 $TIME_SPENT 秒"
echo "日志记录在 $LOG_FILE"

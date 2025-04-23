#!/bin/bash

# quick-download-curl.sh
# 使用 curl 下载多个文件，支持断点续传和日志记录

LOG_FILE="curl-download.log"
START_TIME=$(date +%s)

echo "===== curl 下载脚本 ====="
echo "请输入你要下载的链接（多个链接用空格分隔）："
read -r -a URLS

echo "开始下载..."

for URL in "${URLS[@]}"; do
    FILE_NAME=$(basename "$URL")
    echo "下载中：$URL -> $FILE_NAME"
    
    # 使用 -C - 表示断点续传；-O 保存为原始文件名
    curl -C - -O "$URL" 2>&1 | tee -a "$LOG_FILE"
    
    echo "完成：$URL" >> "$LOG_FILE"
done

END_TIME=$(date +%s)
TIME_SPENT=$((END_TIME - START_TIME))

echo "所有下载完成，用时 $TIME_SPENT 秒"
echo "日志记录在 $LOG_FILE"

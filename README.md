# Bash Download Tools

这是一个使用 `wget`、`curl` 和 `aria2` 实现的 Bash 下载脚本合集，适合 Linux 用户快速下载文件，支持断点续传、日志记录、并发下载等功能。

## 脚本列表

| 文件名                     | 工具    | 特点                     |
|---------------------------|---------|--------------------------|
| quick-download.sh         | wget    | 稳定、支持断点续传       |
| quick-download-curl.sh    | curl    | 更轻量，适合 API 下载     |
| quick-download-aria2.sh   | aria2   | 多线程、高速、BT 支持    |

## 使用方法

```bash
chmod +x quick-download*.sh
./quick-download.sh

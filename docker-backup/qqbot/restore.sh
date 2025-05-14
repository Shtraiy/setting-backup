#!/bin/bash

# 使用之前确保处于maim-bot目录下，这个脚本是恢复脚本
# 使用之前确保包含所有备份文件

cp ./restore.sh ../docker-backup
cd ../docker-backup/

echo "开始导入镜像..."
docker load -i napcat.tar
docker load -i mongo.tar
docker load -i maimbot-adapter.tar
docker load -i maimbot.tar

echo "镜像导入结束...下面开始还原数据和配置文件"

cp docker-compose.yml ../maim-bot
cp data-backup.tar ../maim-bot
cp config-backup.tar ../maim-bot

echo "正在迁移数据"

cd ../maim-bot
rm -rf data
rm -rf docker-config

tar -xvf data-backup.tar
tar -xvf config-backup.tar
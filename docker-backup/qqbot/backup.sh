#!/bin/bash

# 使用之前确保处于maim-bot目录下，这个脚本是备份脚本

mkdir ../docker-backup
cd ../docker-backup

echo "开始打包镜像..."
docker save -o napcat.tar mlikiowa/napcat-docker:latest
docker save -o mongo.tar mongo:latest
docker save -o maimbot-adapter.tar unclas/maimbot-adapter:latest
docker save -o maimbot.tar sengokucola/maimbot:main

echo "镜像打包成功...下面开始打包配置文件以及数据"

cp ../maim-bot/docker-compose.yml .

cd ../maim-bot && tar -cvf ../docker-backup/data-backup.tar -C ./ data/
cd ../maim-bot && tar -cvf ../docker-backup/config-backup.tar -C ./ docker-config/

echo "配置和数据打包成功..."


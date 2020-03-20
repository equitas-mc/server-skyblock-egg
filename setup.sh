#!/bin/bash

apt update
apt install -y wget
cd /mnt/server

wget https://builds.cuberite.org/job/Cuberite%20Linux%20x64%20Master/lastSuccessfulBuild/artifact/Cuberite.tar.gz
tar -xf Cuberite.tar.gz

cp /mnt/server/server-skyblock-egg/settings.ini .
cp /mnt/server/server-skyblock-egg/webadmin.ini .

cd Plugins
git clone https://github.com/Seadragon91/SkyBlock.git
cd SkyBlock
git checkout rework

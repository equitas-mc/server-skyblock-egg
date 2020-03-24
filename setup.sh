#!/bin/bash

apt update
apt install -y wget
cd /mnt/server

rm Cuberite.tar.gz
wget https://builds.cuberite.org/job/Cuberite%20Linux%20x64%20Master/lastSuccessfulBuild/artifact/Cuberite.tar.gz
tar -xf Cuberite.tar.gz

cp /mnt/server/server-skyblock-egg/settings.ini .
cp /mnt/server/server-skyblock-egg/webadmin.ini .

cd Plugins
rm -r SkyBlock
git clone https://github.com/Seadragon91/SkyBlock.git
cd SkyBlock
git checkout cbdd6cf7ed51f118630a11f9a568c011900f87ff

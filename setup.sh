#!/bin/bash

apt update
apt install -y wget sqlite3

# The Ranks.sqlite is only create on server start. to be able to update
# permissions a dump is loaded here
cat Ranks.sql | sqlite3 /mnt/server/Ranks.sqlite

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
cd ..
cd ..

# Update permissions, allow skyblock.command for default rank
sqlite3 Ranks.sqlite "INSERT INTO PermissionItem (PermGroupID, permission) SELECT 1, 'skyblock.command' WHERE NOT EXISTS (SELECT 1 FROM PermissionItem WHERE PermGroupID = 1 AND permission = 'skyblock.command');"

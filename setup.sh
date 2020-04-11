#!/bin/bash

set -e

# For debugging purpose
set -o xtrace

apt update
apt install -y wget sqlite3

cd server-egg
ls -al
./module-cuberite-egg/setup.sh

cp settings.ini Cuberite/
cp webadmin.ini Cuberite/

ln -s ../../SkyBlock Cuberite/Plugins/SkyBlock

# Update permissions, allow skyblock.command for default rank
sqlite3 Cuberite/Ranks.sqlite "INSERT INTO PermissionItem (PermGroupID, permission) SELECT 1, 'skyblock.command' WHERE NOT EXISTS (SELECT 1 FROM PermissionItem WHERE PermGroupID = 1 AND permission = 'skyblock.command');"

#!/bin/bash

set -e

# For debugging purpose
set -o xtrace

apt update
apt install -y wget sqlite3

./server-egg/module-cuberite-egg/setup.sh

cp server-egg/settings.ini Cuberite/
cp server-egg/webadmin.ini Cuberite/

ln -s ../../server-egg/SkyBlock Cuberite/Plugins/SkyBlock
ln -s ../../server-egg/BlockInteractions Cuberite/Plugins/BlockInteractions

# Update permissions, allow skyblock.command for default rank
sqlite3 Cuberite/Ranks.sqlite "INSERT INTO PermissionItem (PermGroupID, permission) SELECT 1, 'skyblock.command' WHERE NOT EXISTS (SELECT 1 FROM PermissionItem WHERE PermGroupID = 1 AND permission = 'skyblock.command');"

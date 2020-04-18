docker build -t skyblock-server-egg .
docker run --name server-skyblock-egg skyblock-server-egg:latest /bin/sh -c 'cd Cuberite && ./Cuberite'
#docker rm server-skyblock-egg

docker build -t skyblock-server-egg .
docker -D run --name server-skyblock-egg --rm --publish=25603:25603 --publish=26603:26603 -ti skyblock-server-egg:latest /bin/bash -c 'cd Cuberite && ./Cuberite'

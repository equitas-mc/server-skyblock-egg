set -e

docker build -t server-skyblock-egg .
docker -D run --name server-skyblock-egg --rm --publish=25603:25603 --publish=26603:26603 -ti server-skyblock-egg:latest /bin/bash -c 'cd Cuberite && ./Cuberite'

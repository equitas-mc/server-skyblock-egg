FROM quay.io/parkervcp/pterodactyl-images:base_debian

COPY . /home/container/server-egg
USER root
RUN ./server-egg/setup.sh

EXPOSE 25603 26603

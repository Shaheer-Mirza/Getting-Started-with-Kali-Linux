#!/bin/bash
sudo su
cd /usr/local
git clone https://github.com/searxng/searxng-docker.git
cd searxng-docker

sed -i "s|ultrasecretkey|$(openssl rand -hex 32)|g" searxng/settings.yml

docker compose up -d

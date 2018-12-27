#!/usr/bin/env bash

# run latest Minecraft server with 2Gb-4Gb memory
docker run -d -p 25565:25565 -v /path/to/server:/data --restart=unless-stopped oglcraft/minecraft-server -Xms2G -Xmx4G

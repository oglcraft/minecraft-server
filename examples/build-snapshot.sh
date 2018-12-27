#!/usr/bin/env sh

docker build https://github.com/oglcraft/minecraft-server.git -t oglcraft/minecraft-server:latest --build-arg type=snapshot

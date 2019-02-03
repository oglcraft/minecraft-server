# minecraft-server
A version-agnostic Vanilla Minecraft Server Dockerfile

### To build (defaults to latest version)
```
$ docker build https://github.com/oglcraft/minecraft-server.git \
    -t oglcraft/minecraft-server:latest \
    [-t oglcraft/minecraft-server:<version>] \
    [--build-arg version=<version>]
```

### To run
```
$ docker run -d -p 25565:25565 -v /path/to/world:/data [--restart=unless-stopped] oglcraft/minecraft-server[:<version>]
```

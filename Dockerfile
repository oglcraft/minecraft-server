# stage 1: pull MC files
FROM alpine as download
RUN apk --no-cache add curl jq

# set variables
ARG version
ARG type=release
ENV meta_url https://launchermeta.mojang.com/mc/game/version_manifest.json

# pull down server jar of the appropriate version 
RUN if [ "$version" = "" ] ; then \
    version=$(curl -s $meta_url | jq -r '.latest.$type') \
  ; fi && \
  VERSION_URL=$(curl -s $meta_url | \
    jq -r --arg VERSION "$version" \
    '.versions[] | select(.id == $VERSION) | .url' \
  ) && \
  JAR_URL=$(curl -s $VERSION_URL | jq -r '.downloads.server.url') && \
  curl -s $JAR_URL -o server.jar

# stage 2: install JRE and run MC server
FROM alpine

# hate mail
MAINTAINER Jesse Pritchett <jesse.h.pritchett@gmail.com>

RUN apk --no-cache add openjdk8-jre

COPY --from=download /server.jar /

# set up working directory
VOLUME /data
WORKDIR /data

# expose default port
EXPOSE 25565

ENTRYPOINT echo "eula=TRUE" > eula.txt && java -jar /server.jar

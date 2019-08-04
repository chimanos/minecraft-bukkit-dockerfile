# Bukkit Dockerfile

FROM openjdk:8-alpine

ARG BUKKIT_VERSION=1.14.4-R0.1-SNAPSHOT

WORKDIR /minecraft

RUN echo $BUKKIT_VERSION
RUN apk update
RUN apk --no-cache add wget git bash
RUN wget -O /minecraft/craftbukkit.jar https://cdn.getbukkit.org/craftbukkit/craftbukkit-$BUKKIT_VERSION.jar

EXPOSE 25565

WORKDIR /data

ADD entrypoint.sh /minecraft/entrypoint.sh

ENTRYPOINT ["/minecraft/entrypoint.sh"]

CMD ["craftbukkit"]

#Fetch latest cfx

RUN apk update --no-cache && apk add make gcc libtool musl-dev

WORKDIR /app

RUN wget https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/6478-8e6c18939ae3f931cc86427376f78dce5e89da5a/fx.tar.xz


RUN tar xf fx.tar.xz
RUN rm fx.tar.xz

COPY txData/default/data /app/txData/default/data
COPY txData/default/config.json /app/txData/default/config.json
COPY txData/Vorpcore_2F5DDE.base/resources /app/txData/Vorpcore_2F5DDE.base/resources
COPY txData/Vorpcore_2F5DDE.base/*.cfg /app/txData/Vorpcore_2F5DDE.base/
COPY txData/admins.json /app/txData/

# RUN apk update --no-cache && apk upgrade --no-cache
# RUN addgroup -g 1000 -S cfx && adduser -u 1000 -S cfx -G cfx
# RUN chown cfx:cfx /app
# USER cfx

EXPOSE 30120/tcp 30120/udp 40120/tcp

# ENTRYPOINT ["tail", "-f", "/dev/null"]
CMD ["/bin/sh", "run.sh"]
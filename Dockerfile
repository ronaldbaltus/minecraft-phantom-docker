FROM debian:stable

ARG VERSION=0.5.3
ENV MCSERVER=localhost:19132
RUN apt-get update && apt-get install -y wget
RUN mkdir -p /phantom && cd /phantom
WORKDIR /phantom
RUN wget -O /phantom/phantom-linux https://github.com/jhead/phantom/releases/download/v$VERSION/phantom-linux-arm7
RUN chmod +x /phantom/phantom-linux
ENTRYPOINT ./phantom-linux -server "$MCSERVER"
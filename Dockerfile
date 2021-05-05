ARG ARCH=
FROM $ARCH/debian:buster-slim
ARG ARCH
ARG VERSION=0.5.3
ENV MCSERVER localhost:19132
RUN apt-get update && apt-get install -y wget
RUN mkdir -p /phantom && cd /phantom
RUN echo $ARCH
WORKDIR /phantom

RUN if [ "$ARCH" = "amd64" ]; then POSTURL="phantom-linux"; \
    elif [ "$ARCH" = "arm32v5" ]; then POSTURL="phantom-linux-arm5"; \
    elif [ "$ARCH" = "arm32v6" ]; then POSTURL="phantom-linux-arm6"; \
    elif [ "$ARCH" = "arm32v7" ]; then POSTURL="phantom-linux-arm7"; \
    elif [ "$ARCH" = "arm32v8" ]; then POSTURL="phantom-linux-arm8"; \
    fi && \
    wget -O /phantom/phantom-linux https://github.com/jhead/phantom/releases/download/v$VERSION/$POSTURL
RUN chmod +x /phantom/phantom-linux
ENTRYPOINT ./phantom-linux -server "$MCSERVER"
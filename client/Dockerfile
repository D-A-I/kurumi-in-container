# global args
ARG DEBIAN_IMAGE_VER=buster-slim
ARG CLIENT_PATH=/kurumi-client

# image
FROM debian:${DEBIAN_IMAGE_VER} AS builder

# tools
RUN apt-get update && apt-get install -y \
  git \
  curl \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

ARG CLIENT_PATH
RUN git clone https://github.com/D-A-I/kurumi-client.git
RUN mv ${CLIENT_PATH} /app \
  && mkdir ./app/json

# node
WORKDIR /app/
ENTRYPOINT ["sh", "client.sh"]

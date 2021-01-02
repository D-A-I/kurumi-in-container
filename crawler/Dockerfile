# global args
ARG NODE_VER=15
ARG NODE_IMAGE_VER=${NODE_VER}-buster-slim
ARG CHROME_IMAGE_VER=87.0
ARG CRAWLER_PATH=/kurumi-crawler

# build stage
FROM node:${NODE_IMAGE_VER} AS builder

# tools
RUN apt-get update && apt-get install -y \
  git \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# build
ARG CRAWLER_PATH
RUN git clone https://github.com/D-A-I/kurumi-crawler.git
COPY init.json ${CRAWLER_PATH}/init.json
WORKDIR ${CRAWLER_PATH}
RUN npm install && npm run build

# prod stage
ARG CHROME_IMAGE_VER
FROM selenium/standalone-chrome:${CHROME_IMAGE_VER} AS production

USER root

# tools
ARG NODE_VER
RUN curl -sS https://deb.nodesource.com/setup_${NODE_VER}.x | bash - \
  && apt-get install -y nodejs \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# setup
ARG CRAWLER_PATH
COPY init.json /app/init.json
COPY --from=builder ${CRAWLER_PATH}/dist /app/
RUN mkdir ./app/json

# proc run
WORKDIR /app/
ENTRYPOINT ["node", "main.js"]

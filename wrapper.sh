#!/bin/sh

# crawlerの起動
docker-compose run --rm -T --name `uuidgen` crawler
# clientの起動
docker-compose run --rm -T --name `uuidgen` client

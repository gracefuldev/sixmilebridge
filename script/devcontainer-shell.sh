#!/bin/sh
docker-compose up -d && docker-compose exec app /bin/bash -l "$@"
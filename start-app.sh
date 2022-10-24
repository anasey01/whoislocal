#!/bin/bash

OPTIONS="development staging production"
select opt in $OPTIONS; do
    if [ "$opt" = "development" ]; then
        echo "Starting app in Dev mode"
        docker-compose -f docker-compose.yml --env-file .env up
        exit 0;
    elif [ "$opt" = "staging" ]; then
        echo "Starting app in staging mode"
    elif [ "$opt" = "production" ]; then
        echo "Starting app in production mode"
    fi
done
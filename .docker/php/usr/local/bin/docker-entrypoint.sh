#!/usr/bin/env bash
set -e

if [[ -z "$YII_ENV" ]]; then
    echo "Environment variable YII_ENV is required"
    exit 1
fi

if [[ -z "$DATABASE_HOST" ]]; then
    echo "Environment variable DATABASE_HOST is required"
    exit 1
fi

if [[ -z "$DATABASE_DB" ]]; then
    echo "Environment variable DATABASE_DB is required"
    exit 1
fi

if [[ -z "$DATABASE_PORT" ]]; then
    echo "Environment variable DATABASE_PORT is required"
    exit 1
fi

if [[ -z "$DATABASE_USER" ]]; then
    echo "Environment variable DATABASE_USER is required"
    exit 1
fi

if [[ -z "$DATABASE_PASSWORD" ]]; then
    echo "Environment variable DATABASE_PASSWORD is required"
    exit 1
fi

PHP_MEMORY_LIMIT=${PHP_MEMORY_LIMIT:-147639500} #in bytes

exec docker-php-entrypoint "$@"

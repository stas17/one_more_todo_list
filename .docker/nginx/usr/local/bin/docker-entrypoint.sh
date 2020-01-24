#!/usr/bin/env bash

export FAST_CGI_PASS_ADDRESS=${FAST_CGI_PASS_ADDRESS:-'localhost'}

test -f /etc/nginx/conf.d/main.conf && rm -f /etc/nginx/conf.d/main.conf
envsubst "\${FAST_CGI_PASS_ADDRESS}" < /etc/nginx/conf.d/main.conf.template > /etc/nginx/conf.d/default.conf

exec nginx -g 'daemon off;'

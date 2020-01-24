FROM nginx:1.15.9

COPY ./.docker/nginx/etc /etc
COPY ./.docker/nginx/usr /usr
COPY ./web /usr/src/web

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

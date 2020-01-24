# COMMON BUILD ARGS
ARG PHP_TYPE=fpm

### COMPOSER DEPENDENCIES
FROM composer:1.8.4 as composer

COPY ./composer.json /src/composer.json
COPY ./composer.lock /src/composer.lock

WORKDIR /src

RUN composer global require hirak/prestissimo \
    && composer global require "fxp/composer-asset-plugin:^1.2.0" \
    && composer install --ignore-platform-reqs --no-scripts \
    && composer dump-autoload \
    && composer global remove hirak/prestissimo

### PHP
FROM php:7.4.1-${PHP_TYPE}

ENV PHP_OPCACHE_VALIDATE_TIMESTAMPS="0" \
    PHP_OPCACHE_MAX_ACCELERATED_FILES="10000" \
    PHP_OPCACHE_MEMORY_CONSUMPTION="192" \
    PHP_OPCACHE_MAX_WASTED_PERCENTAGE="10"

COPY ./ /usr/src/
COPY ./.docker/php/usr /usr
COPY --from=composer /src/vendor /usr/src/vendor
COPY --from=composer /tmp/vendor /tmp/vendor

WORKDIR /usr/src

# libicu-dev - for intl
# libpq-dev - for postgresql
# libldap2-dev - for ldap
RUN apt-get update && apt-get install -y --no-install-recommends libicu-dev libpq-dev libldap2-dev \
    && docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu \
    && docker-php-ext-configure opcache --enable-opcache \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl pdo pdo_pgsql ldap opcache \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* || true

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

CMD ["php-fpm"]

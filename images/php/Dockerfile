FROM php:7-fpm

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils less nano \
  libpq-dev libzip-dev libicu-dev libpng-dev libjpeg62-turbo-dev libfreetype6-dev libmagickwand-6.q16-dev libxslt-dev libz-dev \
  libmemcached-dev \
  git openssl zip git

RUN docker-php-ext-configure zip --with-libzip \
  && docker-php-ext-install pdo_mysql pdo_pgsql intl zip opcache

RUN pecl install -f imagick apcu redis memcached xdebug 
# xdebug-2.7.0beta1

RUN docker-php-ext-enable xdebug apcu memcached

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && composer global require "fxp/composer-asset-plugin:^1.3.1"

WORKDIR /var/www/html
CMD ["php-fpm"]
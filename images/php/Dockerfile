FROM php:7.2-fpm

RUN apt-get update && apt-get install -y libpq-dev libzip-dev libicu-dev libpng-dev libjpeg62-turbo-dev libfreetype6-dev libmagickwand-6.q16-dev libxslt-dev git openssl

RUN docker-php-ext-install pdo pdo_mysql pdo_pgsql mbstring intl zip
RUN pecl install imagick xdebug apcu redis
RUN docker-php-ext-enable xdebug

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
COPY php.ini /etc/php/7.1/fpm/conf.d/40-custom.ini

WORKDIR /var/www/html
CMD ["php-fpm"]

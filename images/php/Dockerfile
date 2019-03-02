FROM php:7.3-fpm

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils libpq-dev libzip-dev libicu-dev libpng-dev libjpeg62-turbo-dev libfreetype6-dev libmagickwand-6.q16-dev libxslt-dev git openssl zip git

RUN docker-php-ext-configure zip --with-libzip
RUN docker-php-ext-install pdo_mysql pdo_pgsql intl zip opcache 
RUN pecl install -f imagick apcu redis xdebug-2.7.0beta1
RUN docker-php-ext-enable xdebug

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
#COPY www.conf /usr/local/etc/php-fpm.d/www.conf

WORKDIR /var/www/html
CMD ["php-fpm"]

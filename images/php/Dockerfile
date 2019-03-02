FROM php:7.3-fpm

RUN apt-get update && apt-get install -y libpq-dev libzip-dev libicu-dev libpng-dev libjpeg62-turbo-dev libfreetype6-dev libmagickwand-6.q16-dev libxslt-dev git openssl

RUN docker-php-ext-install pdo pdo_mysql pdo_pgsql mbstring intl zip
RUN pecl install imagick xdebug apcu redis
RUN docker-php-ext-enable xdebug

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
#COPY www.conf /usr/local/etc/php-fpm.d/www.conf

WORKDIR /var/www/html
CMD ["php-fpm"]

FROM php:7.4-fpm-alpine

# Install system packages & PHP extensions required for Yii 2.0 Framework
RUN apk --update --virtual build-deps add \
        autoconf \
        make \
        gcc \
        g++ \
        libtool \
        icu-dev \
        curl-dev \
        freetype-dev \
        imagemagick-dev \
        pcre-dev \
        libmcrypt-dev \
        libjpeg-turbo-dev \
        libpng-dev \
        libxml2-dev \
        postgresql-dev \
        zlib-dev \
        libzip-dev \
        libmemcached-dev \
        oniguruma-dev && \
    apk add \
        git \
        curl \
        bash \
        bash-completion \
        icu \
        imagemagick \
        pcre \
        freetype \
        libmcrypt \
        libintl \
        libjpeg-turbo \
        libpng \
        libltdl \
        libxml2 \
        libpq \
        libzip \
        libmemcached \
        mysql-client \
        zip \
        tzdata && \
    pecl channel-update pecl.php.net && \
    pecl install \
        apcu \
        imagick \
        redis \
        memcached \
        xdebug \
        mcrypt && \
    docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-configure bcmath && \
    docker-php-ext-configure intl && \
    docker-php-ext-configure zip && \
    docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql && \
    docker-php-ext-install \
        soap \
        zip \
        curl \
        bcmath \
        exif \
        gd \
        iconv \
        intl \
        pgsql \
        mbstring \
        opcache \
        pdo \
        pdo_mysql \
        pdo_pgsql && \
    apk del \
        build-deps

RUN if [ "${PHP_XDEBUG_ENABLED}" = "1" ] ; then cp /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini; \
 else cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini; fi

RUN echo "extension=apcu.so" > /usr/local/etc/php/conf.d/pecl-apcu.ini \
 && echo "extension=imagick.so" > /usr/local/etc/php/conf.d/pecl-imagick.ini \
 && echo "extension=mcrypt.so" > /usr/local/etc/php/conf.d/pecl-mcrypt.ini \
 && echo "extension=redis.so" > /usr/local/etc/php/conf.d/pecl-redis.ini \
 && echo "extension=memcached.so" > /usr/local/etc/php/conf.d/pecl-memcached.ini \
 && echo "zend_extension=xdebug.so" > /usr/local/etc/php/conf.d/pecl-xdebug.ini

## locale
RUN cp /usr/share/zoneinfo/Europe/Moscow /etc/localtime && echo "Europe/Moscow" >  /etc/timezone

# Configure version constraints
ENV TZ=Europe/Moscow \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8 \
    PHP_ENABLE_XDEBUG=0 \
    PATH=/projects:/root/.composer/vendor/bin:$PATH \
    TERM=linux \
    COMPOSER_ALLOW_SUPERUSER=1

COPY bin/* /usr/local/bin/
COPY conf.d/* /usr/local/etc/php/conf.d/
COPY php-fpm.d/* /usr/local/etc/php-fpm.d/

RUN sed -i "s|;*daemonize\s*=\s*yes|daemonize = no|g" /usr/local/etc/php-fpm.conf && \
    sed -i "s|;*cgi.fix_pathinfo=.*|cgi.fix_pathinfo= 0|i" /usr/local/etc/php/php.ini

RUN chmod +x /usr/local/bin/*

## composer
RUN curl -sS https://getcomposer.org/installer | php -- \
        --filename=composer.phar \
        --install-dir=/usr/local/bin && \
    composer global require --optimize-autoloader \
        "fxp/composer-asset-plugin:^1.4.3" \
        "hirak/prestissimo:^0.3.0" && \
    composer global dumpautoload --optimize && \
    composer clear-cache

WORKDIR /projects

# Startup script for FPM
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["php-fpm"]
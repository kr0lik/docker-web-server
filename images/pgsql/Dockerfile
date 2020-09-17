ARG VER=12

FROM postgres:${VER}-alpine

ARG VER

RUN apk --update --virtual build-deps add \
        autoconf \
        automake \
        file \
        json-c-dev \
        libtool \
        libxml2-dev \
        make \
        clang-dev \
        g++ \
        gcc \
        geos-dev \
        llvm \
        llvm-dev \
    && apk add \
        git \
        perl \
        py-pip \
        tzdata \
    && git clone https://github.com/postgrespro/rum \
    && cd rum \
    && make USE_PGXS=1 \
    && make USE_PGXS=1 install \
    && apk del \
        build-deps

COPY tsearch_data /usr/share/postgresql/$VER/tsearch_data
COPY bin /docker-entrypoint-initdb.d/

ENV TZ Europe/Moscow
ENV PGTZ Europe/Moscow
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8
RUN cp /usr/share/zoneinfo/Europe/Moscow /etc/localtime && echo "Europe/Moscow" >  /etc/timezone

RUN postgres &\
 psql --command "SET TIME ZONE 'Europe/Moscow';" &

RUN echo "log_timezone = 'Europe/Moscow'" /var/lib/postgresql/data/postgresql.conf
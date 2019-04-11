FROM postgres:11

ARG VER=11

RUN mkdir -p "$PGDATA" && chown -Rf postgres:postgres "$PGDATA"

RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates wget python-pip curl build-essential git systemtap-sdt-dev perl libcache-memcached-perl
RUN apt-get install -y --no-install-recommends libpq-dev postgresql-server-dev-$VER postgresql-pltcl-$VER postgresql-plperl-$VER postgresql-$VER-cron

RUN git clone https://github.com/postgrespro/rum && cd rum && make USE_PGXS=1 && make USE_PGXS=1 install
# && make USE_PGXS=1 installcheck

COPY tsearch_data /usr/share/postgresql/$VER/tsearch_data

CMD ["postgres"]

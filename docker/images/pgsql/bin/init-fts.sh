#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE TEXT SEARCH DICTIONARY russian_hunspell (
      TEMPLATE = ispell,
      DictFile = ru_ru,
      AffFile = ru_ru,
      Stopwords = russian
    );
    CREATE TEXT SEARCH CONFIGURATION russian_fts ( COPY = pg_catalog.russian );
    ALTER TEXT SEARCH CONFIGURATION russian_fts
      ALTER MAPPING FOR asciihword, asciiword, hword, hword_asciipart, hword_part, word
      WITH russian_hunspell, russian_stem, english_stem;
EOSQL
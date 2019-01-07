#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE DATABASE shared;
    \connect shared;
    CREATE USER guest;
    CREATE TABLE data (id integer, label text, score float);
    \copy data FROM '/docker-entrypoint-initdb.d/data.tsv';
    CREATE INDEX data_idx ON data (id);
    GRANT SELECT ON ALL TABLES IN SCHEMA public TO guest;
    ANALYZE VERBOSE;
EOSQL
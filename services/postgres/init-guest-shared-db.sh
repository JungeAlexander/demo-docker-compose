#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER guest;
    CREATE DATABASE shared;
    GRANT SELECT ON DATABASE shared TO guest;
EOSQL

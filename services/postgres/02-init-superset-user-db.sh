#!/bin/bash
set -e # exit if a command exits with a not-zero exit code

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
CREATE USER superset WITH
    LOGIN
    NOSUPERUSER
    NOCREATEDB
    NOCREATEROLE
    NOINHERIT
    NOREPLICATION
    PASSWORD '$SUPERSET_PASSWORD';
CREATE DATABASE superset OWNER superset;
EOSQL


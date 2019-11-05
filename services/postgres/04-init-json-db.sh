#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    \connect shared;
    CREATE TABLE json (data jsonb);
    \copy json FROM '/import_data/json/random_generated.jsonl';
    CREATE INDEX index ON json ((data->>'index'));
    GRANT SELECT ON json TO guest;
    GRANT ALL ON ALL TABLES IN SCHEMA public TO shareduser;
EOSQL
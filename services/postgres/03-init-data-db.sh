#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    \connect shared;
    CREATE TABLE tox21 (NR_AR boolean, NR_AR_LBD boolean, NR_AhR boolean, NR_Aromatase boolean, 
    NR_ER boolean, NR_ER_LBD boolean, NR_PPAR_gamma boolean, SR_ARE boolean, SR_ATAD5 boolean, 
    SR_HSE boolean, SR_MMP boolean, SR_p53 boolean, mol_id text, smiles text);
    \copy tox21 FROM '/import_data/tox21/tox21.csv' DELIMITER ',' CSV HEADER;
    CREATE INDEX tox21_idx ON tox21 (mol_id);
    GRANT SELECT ON tox21 TO guest;
    GRANT ALL ON ALL TABLES IN SCHEMA public TO shareduser;
EOSQL
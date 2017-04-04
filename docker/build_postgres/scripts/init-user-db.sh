#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username admin <<-EOSQL
    CREATE USER oauth;
    CREATE DATABASE oauth;
    GRANT ALL PRIVILEGES ON DATABASE oauth TO oauth;
	ALTER USER "oauth" WITH PASSWORD 'oauth';
EOSQL


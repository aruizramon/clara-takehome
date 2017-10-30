#!/usr/bin/env bash

test "${0%/*}" != "./scripts" && (
        echo "Run scripts from the project root. "; exit 1
    )

PROJECT_NAME='takehome'

brew install \
    autoconf automake cmake git htop openssl virtualenv \
    postgresql-9.6 postgresql-common postgresql-contrib-9.6 \
    postgresql-server-dev-all \
    python3.6 python3.6-dev


virtualenv env --python=python3.6
source env/bin/activate
pip install -r requirements.txt

echo -n "
    CREATE DATABASE ${PROJECT_NAME};
    CREATE USER ${PROJECT_NAME} WITH PASSWORD 'secret-pwd';
    GRANT ALL PRIVILEGES ON DATABASE ${PROJECT_NAME} TO ${PROJECT_NAME};
" | psql

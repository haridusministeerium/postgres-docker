#!/usr/bin/env bash
#
# NOTE: per https://hub.docker.com/_/postgres#initialization-scripts scripts in
# /docker-entrypoint-initdb.d only run if you start the container w/ a data dir
# that is empty; any pre-existing db will be left untouched on container
# startup.
##############################################

set -e

#echo "Creating pg_cron extension..."

# create the pg_cron functions and metadata tables (see https://github.com/citusdata/pg_cron#setting-up-pg_cron)
psql -v ON_ERROR_STOP=1 --username "${POSTGRES_USER:-postgres}" \
    --dbname "${POSTGRES_DB:-postgres}"  <<-EOSQL
CREATE EXTENSION IF NOT EXISTS pg_cron;
EOSQL

#echo "pg_cron extension has been installed and configured."


#!/bin/bash
set -eo pipefail

#curl -s https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
echo "deb [signed-by=/usr/share/keyrings/pgdg-archive-keyring.gpg] http://apt.postgresql.org/pub/repos/apt bullseye-pgdg main" > /etc/apt/sources.list.d/pgdg.list 
curl -s https://www.postgresql.org/media/keys/ACCC4CF8.asc | gpg --dearmor -o /usr/share/keyrings/pgdg-archive-keyring.gpg

apt-get update
apt-get install -y --no-install-recommends postgresql-client libpq-dev
apt-get -y install -f --no-install-recommends
apt-get clean

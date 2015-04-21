#!/usr/bin/env bash
echo "****************************************"
echo "*** Starting Postgresql installation ***"
echo "****************************************"

PG_VERSION=9.3

apt-get -y install postgresql postgresql-contrib

sudo sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/g" /etc/postgresql/$PG_VERSION/main/postgresql.conf
echo "host    all             all             0.0.0.0/0               md5" | sudo tee -a /etc/postgresql/$PG_VERSION/main/pg_hba.conf
sudo service postgresql restart

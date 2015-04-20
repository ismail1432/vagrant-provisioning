#!/usr/bin/env bash
echo "Starting Postgresql installation"

apt-get -y install postgresql postgresql-contrib libpq-dev python-dev

sudo sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/g" /etc/postgresql/9.3/main/postgresql.conf
echo "host    all             all             0.0.0.0/0               md5" | sudo tee -a /etc/postgresql/9.3/main/pg_hba.conf
sudo service postgresql restart

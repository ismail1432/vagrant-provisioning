#!/usr/bin/env bash

DJANGO_PROJECT=$1
DB_NAME=$2
DB_USER=$3
DB_PWD=$4

apt-get install -y python-pip
apt-get install -y postgresql postgresql-contrib

cat << EOF | su - postgres -c psql
CREATE USER $DB_USER WITH PASSWORD '$DB_PWD';

CREATE DATABASE $DB_NAME WITH OWNER $DB_USER;
EOF

pip install -r /vagrant/provision/django/requirements.txt

cd /vagrant
django-admin startproject --template=https://github.com/meatballs/django-vagrant-template/archive/master.zip $DJANGO_PROJECT
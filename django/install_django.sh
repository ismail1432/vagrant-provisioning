#!/usr/bin/env bash

# Assign the script arguments to meaningful variables
DJANGO_PROJECT=$1
DB_NAME=$2
DB_USER=$3
DB_PWD=$4

# install pip and postgres
apt-get install -y python-pip postgresql postgresql-contrib

# create the postgres user and database
cat << EOF | su - postgres -c psql
CREATE USER $DB_USER WITH PASSWORD '$DB_PWD';

CREATE DATABASE $DB_NAME WITH OWNER $DB_USER;
EOF

# install django and its dependencies
pip install -r /vagrant/provision/django/requirements.txt

# create the django project from my template
cd /vagrant
django-admin startproject --template=https://github.com/meatballs/django-vagrant-template/archive/master.zip $DJANGO_PROJECT

# configure the django dev server as an upstart daemon
cp /vagrant/provision/django/django-server.conf /etc/init
sed -i "s/{{ project_name }}/$DJANGO_PROJECT/" /etc/init/django-server.conf
start django-server
#!/usr/bin/env bash

# Assign the script arguments to meaningful variables
DJANGO_PROJECT=$1
DB_NAME=$2
DB_USER=$3
DB_PWD=$4

# install pip
apt-get install -y python-pip

# install django and neo4django
pip install Django==1.7.1
pip install neo4django

# create the django project from my template
cd /vagrant
django-admin startproject --template=https://github.com/meatballs/django-vagrant-template/archive/master.zip $DJANGO_PROJECT

# configure the django dev server as an upstart daemon
cp /vagrant/provision/django/django-server.conf /etc/init
sed -i "s/{{ project_name }}/$DJANGO_PROJECT/" /etc/init/django-server.conf
start django-server
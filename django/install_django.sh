#!/usr/bin/env bash

# Assign the script arguments to meaningful variables
DJANGO_PROJECT=$1

# install pip
apt-get install -y python-pip

# install python packages from requirements
pip install -r requirements.txt

# configure the django dev server as an upstart daemon
cp /vagrant/provision/django/django-server.conf /etc/init
sed -i "s/{{ project_name }}/$DJANGO_PROJECT/" /etc/init/django-server.conf
start django-server

#!/usr/bin/env bash
echo "Starting Django installation"

# Assign the script arguments to meaningful variables
DJANGO_PROJECT=$1

# install pip
apt-get install -y python-pip

# install python packages
pip install -r /vagrant/requirements.txt

# Create database
su postgres -c "createuser -w -d -r -s $DJANGO_PROJECT"
sudo -u postgres psql -c "ALTER USER $DJANGO_PROJECT WITH PASSWORD '$DJANGO_PROJECT';"
su postgres -c "createdb -O $DJANGO_PROJECT $DJANGO_PROJECT"
cd /vagrant
python manage.py migrate

# configure the django dev server as an upstart daemon
cp /vagrant/provision/django/django-server.conf /etc/init
start django-server

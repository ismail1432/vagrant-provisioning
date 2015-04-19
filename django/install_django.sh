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
su postgres -c "createdb -O $DJANGO_PROJECT $DJANGO_PROJECT"

# Set environment variables
echo "export DEBUG='True'" >> ~/.zshrc
echo "export DATABASE_URL='postgres://djaxelrod@localhost/djaxelrod'" >> ~/.zshrc
echo "export SECRET_KEY='NeedToComeUpWithABetterSecretKey'" >> ~/.zshrc

# configure the django dev server as an upstart daemon
cp /vagrant/provision/django/django-server.conf /etc/init
sed -i "s/{{ project_name }}/$DJANGO_PROJECT/" /etc/init/django-server.conf
start django-server

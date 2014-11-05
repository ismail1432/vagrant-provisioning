#!/usr/bin/env bash

apt-get install -y python-pip
pip install -r /vagrant/provision/pelican/requirements.txt
cp /vagrant/provision/pelican/*.conf /etc/init
start pelican-server
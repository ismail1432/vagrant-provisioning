#!/usr/bin/env bash
#!/usr/bin/env bash
echo "**************************"
echo "*** Installing Pelican ***"
echo "**************************"

apt-get install -y python-pip
pip install -r /vagrant/provision/pelican/requirements.txt
cp /vagrant/provision/pelican/*.conf /etc/init
start pelican-server

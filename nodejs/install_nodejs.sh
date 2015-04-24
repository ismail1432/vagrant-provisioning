#!/usr/bin/env bash
echo "*****************************"
echo "*** Installing NodeJs ***"
echo "*****************************"

# install node and npm
apt-get -y install nodejs npm

# sort out the nodejs vs node naming issue
sudo ln -s /usr/bin/nodejs /usr/bin/node

# install the grunt cli
npm install -g grunt-cli

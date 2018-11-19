#!/bin/sh

# INSTALL JAVA
sudo apt-get install -y python-software-properties debconf-utils
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
sudo apt-get install -y oracle-java8-installer

# INSTALL CHROMIUM
sudo apt-get install fonts-freefont-otf
sudo apt-get install -y chromium-browser
sudo ln -s /usr/bin/chromium-browser /usr/bin/chromium

# CREATE LOOKER USER
sudo groupadd looker
sudo useradd -m -g looker looker
sudo su - looker
mkdir ~/looker
cd ~/looker

# DOWNLOAD APPLICATION AND PREPARE STARTUP SCRIPTS
curl https://s3.amazonaws.com/download.looker.com/aeHee2HiNeekoh3uIu6hec3W/looker-latest.jar -o looker.jar
curl -O https://raw.githubusercontent.com/looker/customer-scripts/master/startup_scripts/looker
chmod 0750 looker
echo LOOKERARGS="--no-ssl" > lookerstart.cfg


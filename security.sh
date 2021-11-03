#!/bin/bash
# installing FRW

sudo apt install ufw
sudo ufw limit in ssh comment 'allow SSH connections in'
# allow traffic out on port 53 -- DNS
sudo ufw allow out 53 comment 'allow DNS calls out'

# allow traffic out on port 123 -- NTP
sudo ufw allow out 123 comment 'allow NTP out'

# allow traffic out for HTTP, HTTPS, or FTP
# apt might needs these depending on which sources you're using
sudo ufw allow out http comment 'allow HTTP traffic out'
sudo ufw allow out https comment 'allow HTTPS traffic out'
sudo ufw allow out ftp comment 'allow FTP traffic out'

# allow whois
sudo ufw allow out whois comment 'allow whois'

# allow traffic out on port 68 -- the DHCP client
# you only need this if you're using DHCP
sudo ufw allow out 67 comment 'allow the DHCP client to update'
sudo ufw allow out 68 comment 'allow the DHCP client to update'
sudo ufw enable
sudo ufw app list

# ClamAv installation
sudo apt install clamav clamav-freshclam clamav-daemon
sudo cp --archive /etc/clamav/freshclam.conf /etc/clamav/freshclam.conf-COPY-$(date +"%Y%m%d%H%M%S")
sudo service clamav-freshclam start
sudo service clamav-freshclam status
sudo cp --archive /etc/clamav/clamd.conf /etc/clamav/clamd.conf-COPY-$(date +"%Y%m%d%H%M%S")

#Lynis - Linux Security Auditing
sudo apt install apt-transport-https ca-certificates host
sudo wget -O - https://packages.cisofy.com/keys/cisofy-software-public.key | sudo apt-key add -
sudo echo "deb https://packages.cisofy.com/community/lynis/deb/ stable main" | sudo tee /etc/apt/sources.list.d/cisofy-lynis.list
sudo apt update
sudo apt install lynis host
sudo lynis update info
sudo lynis audit system

#Configuring Mailing Agent

sudo apt-get -y install exim4
sudo dpkg-reconfigure exim4-config





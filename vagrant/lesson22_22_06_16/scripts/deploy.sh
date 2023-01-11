#!/bin/bash

cd /vagrant/scripts/ || exit
sudo chmod +x answer_bot deploy.sh ssl_create.sh

# Install repo
sudo yum install -y epel-release

# System upate
sudo yum update -y

# Installing nginx
sudo yum install -y nginx
sudo systemctl enable nginx
sudo systemctl start nginx

# Create SSL cert
sudo yum install -y expect
sudo timedatectl set-timezone America/New_York
sudo mkdir /etc/ssl/private
sudo chmod 700 /etc/ssl/private

# Run an automation script for user input
./answer_bot

# Return to executing main script
sudo openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048

# Copy config files
sudo cp ./files/ssl.conf /etc/nginx/conf.d/ssl.conf
sudo cp ./files/ssl-redirect.conf /etc/nginx/default.d/ssl-redirect.conf
sudo cp ./files/index.html /usr/share/nginx/html/index.html

# Run nginx
sudo nginx -t
sudo systemctl restart nginx

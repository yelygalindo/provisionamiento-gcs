#!/bin/bash

yum -y install epel-release 
yum -y install java-1.8.0-openjdk-devel nginx 
curl -L https://raw.githubusercontent.com/yelygalindo/provisionamiento-gcs/main/web/application.conf > /home/raillon/application.conf 
curl -L https://raw.githubusercontent.com/yelygalindo/provisionamiento-gcs/main/web/update.sh > /home/raillon/update.sh 
chmod +x /home/raillon/update.sh 
curl -L https://raw.githubusercontent.com/yelygalindo/provisionamiento-gcs/main/web/nginx.conf > nginx.conf 
mv nginx.conf /etc/nginx/ 
systemctl start nginx
mkdir /docs

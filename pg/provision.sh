#!/bin/bash
apt-get clean
cp -r /var/lib/apt/lists /var/lib/apt/lists.old
rm -rf /var/lib/apt/lists/partial/ 
apt-get clean && apt-get update 
apt-get -y install curl apt-transport-https ca-certificates curl software-properties-common 
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - 
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get -y update && apt-get -y install docker-ce 
mkdir /data
curl -L https://raw.githubusercontent.com/yelygalindo/provisionamiento-gcs/main/pg/config/postgresql.conf > /data/postgresql.conf 
curl -L https://raw.githubusercontent.com/yelygalindo/provisionamiento-gcs/main/pg/config/pg_hba.conf > /data/pg_hba.conf
sudo chown -R docker:docker /data/
sudo docker run --rm -itd -v /data:/var/lib/postgresql/data -p 5432:5432 --name pg-fp -e POSTGRES_USER=gcs -e POSTGRES_DB=gcs -e POSTGRES_PASSWORD=gcs postgres:latest

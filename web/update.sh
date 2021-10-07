#!/bin/bash
sudo rpm -e gcs-app
sudo rpm -i /tmp/gcs-app-2.8.x-1.noarch.rpm
sudo chown -R gcs-app /usr/share/gcs-app/
sudo chgrp -R gcs-app /usr/share/gcs-app/
sudo cp application.conf /etc/gcs-app/application.conf
sudo systemctl start gcs-app
sudo rm -r /docs/*
sudo cp -r /usr/share/gcs-app/share/doc /docs
sudo chmod 755 -R /docs
sudo chcon -Rt httpd_sys_content_t /docs

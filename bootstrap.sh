#!/usr/bin/env bash

rm -rf /var/www/public
ln -fs /vagrant/public /var/www/public

sudo yum install -y php53u-mbstring

sudo sed -i 's/session\.save_path = "\/var\/lib\/php\/session"/session\.save_path = "\/tmp"/g' /etc/php.ini

sudo yum install -y phpMyAdmin
sudo sed -i 's/Allow from 127\.0\.0\.1/Allow from 10\.0\.2\.2/g' /etc/httpd/conf.d/phpMyAdmin.conf

sudo cp /vagrant/public/config.inc.php /usr/share/phpMyAdmin

sudo chmod 644 /usr/share/phpMyAdmin/config.inc.php

sudo mysqladmin -u root password root

sudo service httpd restart






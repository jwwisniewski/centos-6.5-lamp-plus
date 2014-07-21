#!/usr/bin/env bash

rm -rf /var/www/public
ln -fs /vagrant/public /var/www/public

sudo yum install -y php53u-mbstring
sudo yum install -y nano
sudo yum install -y phpMyAdmin

sudo cp /vagrant/provision/config.inc.php /usr/share/phpMyAdmin
sudo chmod 644 /usr/share/phpMyAdmin/config.inc.php
sudo sed -i 's/Allow from 127\.0\.0\.1/Allow from 10\.0\.2\.2/g' /etc/httpd/conf.d/phpMyAdmin.conf

sudo mysqladmin -u root password root

sudo sed -i 's/"\/var\/www\/public"/"\/vagrant\/public"/g' /etc/httpd/conf/httpd.conf
sudo sed -i 's/\#NameVirtualHost/NameVirtualHost/g' /etc/httpd/conf/httpd.conf
sudo bash -c "cat /vagrant/provision/httpd.conf.append >> /etc/httpd/conf/httpd.conf"

sudo sed -i 's/session\.save_path = "\/var\/lib\/php\/session"/session\.save_path = "\/tmp"/g' /etc/php.ini
sudo sed -i 's/display_errors = Off/display_errors = On/g' /etc/php.ini
sudo sed -i 's/& ~E_NOTICE/\| E_STRICT/g' /etc/php.ini

sudo service httpd restart






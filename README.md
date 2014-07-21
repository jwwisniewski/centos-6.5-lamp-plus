centos-6.5-lamp-plus
====================

A simple modification of the https://vagrantcloud.com/smallhadroncollider/centos-6.5-lamp vagrant box 

one time provisioning
---------------------
* additional port forwarding, host: 80 to guest: 80
* php53u-mbstring
* nano
* phpMyAdmin
* password for mysql (required by phpMyAdmin)
* virtual hosts
* php session.save_path changed
* php error reporting changed

provisioning done on every startup
----------------------------------
* add new virtual host from a local file
* restart httpd

tools
-----
* phpMyAdmin is available via [localhost/phpMyAdmin](http://localhost/phpMyAdmin)
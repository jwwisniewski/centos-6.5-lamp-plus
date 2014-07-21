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

additional vhosts HOW-TO
------------------------
1. create new project dir under the public directory, i.e. *public/myproj*
2. edit the *provision/httpd.conf.add.new.vhost* file by copying the contents of httpd.conf.append and replacing the lines 
  1. *DocumentRoot /vagrant/public* to *DocumentRoot /vagrant/public/myproj*
  2. *ServerName localhost* to *ServerName myproj.localhost*
3. edit your **host's** hosts file and add the new *myproj.localhost* domain
4. run *vagrant reload*
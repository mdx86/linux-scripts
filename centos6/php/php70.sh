#!/usr/bin/env bash

yum -y remove php*
yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
yum -y install http://rpms.remirepo.net/enterprise/remi-release-6.rpm

yum -y install yum-utils
yum-config-manager --enable remi-php70 

yum -y install php php-mcrypt php-cli php-gd php-curl php-mysql php-ldap php-zip php-fileinfo php-fpm php-mbstring php-pecl-igbinary php-pecl-jsonc php-pecl-redis php-process php-xml php-pdo php-pecl-event

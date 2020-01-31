#!/usr/bin/env bash

yum -y remove php*

yum install epel-release yum-utils -y
yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm -y
yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y

yum-config-manager --disable webtatic
yum-config-manager --enable remi-php70
yum-config-manager --disable remi-php71
yum-config-manager --disable remi-php72
yum-config-manager --disable remi-php73
yum-config-manager --disable remi-php74

yum -y install php php-mcrypt php-cli php-gd php-curl php-mysql php-ldap php-zip php-fileinfo php-fpm php-mbstring php-pecl-igbinary   php-pecl-redis php-process php-xml php-pdo php-pecl-event
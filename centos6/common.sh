#!/usr/bin/env bash

#1.install EPEL
rpm -ivh http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6

#2.install REMI
rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-remi

yum -y install yum-utils

#3.install common software
yum install -y mtr vim tcpdump iftop zip unzip bc bind-utils traceroute redhat-lsb tree
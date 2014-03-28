#!/bin/sh
# install rbenv and ruby required software

MY_GROUP=$1

if [ "$MY_GROUP" = "" ] ; then
    echo '!!! undefined variable MY_GROUP.'
    echo '!!!'
    echo '!!! ex.) MY_GROUP=staff'
    echo '!!!'
    exit 1
fi

# install epel
sudo rpm -ivh http://download.fedora.redhat.com/pub/epel/5/x86_64/epel-release-5-4.noarch.rpms
# ruby required softwares
sudo yum -y install curl curl-devel gcc gcc-c++ git openssl-devel httpd-devel readline-devel tk-devel make zlib-devel libffi-devel

# ruby required softwares
sudo yum --enablerepo=epel -y install libyaml-devel

cd /usr/local

if [ ! -d rbenv -a ! -d ruby-build ]; then
	 git clone git://github.com/sstephenson/rbenv.git rbenv
	 mkdir rbenv/shims rbenv/versions
	 chgrp -R $MY_GROUP rbenv
	 chmod -R g+rwxX rbenv

	 git clone git://github.com/sstephenson/ruby-build.git ruby-build
	 cd ruby-build
	 ./install.sh
fi

if [ ! -f /etc/profile.d/rbenv.sh ]; then
	 echo 'export RBENV_ROOT="/usr/local/rbenv"'     >> /etc/profile.d/rbenv.sh
	 echo 'export PATH="/usr/local/rbenv/bin:$PATH"' >> /etc/profile.d/rbenv.sh
	 echo 'eval "$(rbenv init -)"'                   >> /etc/profile.d/rbenv.sh
fi

source /etc/profile.d/rbenv.sh

exit



#!/bin/sh
# install anyenv required software

MY_GROUP=$1

if [ "$MY_GROUP" = "" ] ; then
    echo '!!! undefined arg'
    echo '!!!'
    echo '!!! ex.) usage:' 
    echo '!!! sudo ./setup_anyenv.sh staff'
    echo '!!!'
    exit 1
fi

AnyHome=/usr/local

if which yum ; then
    # install epel
    rpm -ivh http://download.fedora.redhat.com/pub/epel/5/x86_64/epel-release-5-4.noarch.rpms
    # ruby required softwares
    yum -y install curl libcurl-dev gcc gcc-c++ git openssl-devel httpd-devel readline-devel tk-devel make zlib-devel libffi-devel

    # for python 2.x
    # install python
    yum -y install bzip2-devel sqlite-devel

    # ruby required softwares
    yum --enablerepo=epel -y install libyaml-devel

else
    apt-get -y install curl build-essential git libssl-dev apache2-dev libreadline6-dev tk-dev make zlib1g-dev libffi-dev libssl-dev libssl1.0.0 

    apt-get -y install libyaml-dev
fi


if [ ! -e ${AnyHome}/anyenv ]; then
    git clone https://github.com/riywo/anyenv.git ${AnyHome}/anyenv
    git clone https://github.com/znz/anyenv-update.git ${AnyHome}/anyenv/plugins/anyenv-update
    git clone https://github.com/znz/anyenv-git.git ${AnyHome}/anyenv/plugins/anyenv-git
    chgrp -R $MY_GROUP ${AnyHome}/anyenv
    chmod -R g+rwxX ${AnyHome}/anyenv

fi

if [ ! -e /etc/profile.d/anyenv.sh ]; then
   echo 'export PATH=/usr/local/anyenv/bin:$PATH' >> /etc/profile.d/anyenv.sh
   echo 'export ANYENV_ROOT=/usr/local/anyenv' >> /etc/profile.d/anyenv.sh
   echo 'eval "$(anyenv init -)"' >> /etc/profile.d/anyenv.sh
fi


echo 'source /etc/profile.d/anyenv.sh'
echo 'exec $SHELL -l'

exit



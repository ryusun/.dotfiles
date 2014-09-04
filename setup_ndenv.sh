#!/bin/sh
# install ndenv

MY_GROUP=$1

if [ "$MY_GROUP" = "" ] ; then
    echo '!!! undefined variable MY_GROUP.'
    echo '!!!'
    echo '!!! ex.) MY_GROUP=staff'
    echo '!!!'
    exit 1
fi

cd /usr/local

if [ ! -d ndenv -a ! -d node-build ]; then
	 git clone https://github.com/riywo/ndenv.git
#	 mkdir ndenv/shims ndenv/versions ndenv/plugins
	 mkdir ndenv/plugins
	 chgrp -R $MY_GROUP ndenv
	 chmod -R g+rwxX ndenv

	 git clone https://github.com/riywo/node-build.git ndenv/plugins/node_build
fi

if [ ! -f /etc/profile.d/ndenv.sh ]; then
	 echo 'export NDENV_ROOT="/usr/local/ndenv"'     >> /etc/profile.d/ndenv.sh
	 echo 'export PATH="/usr/local/ndenv/bin:$PATH"' >> /etc/profile.d/ndenv.sh
	 echo 'eval "$(ndenv init -)"'                   >> /etc/profile.d/ndenv.sh
fi

source /etc/profile.d/ndenv.sh

exit



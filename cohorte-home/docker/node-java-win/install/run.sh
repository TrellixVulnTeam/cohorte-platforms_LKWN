#!/bin/bash
echo "--- Boot of Cohorte Container..."
#./opt/init.sh
# check what kind of init we have. init.sh or init.py 
PWD=`pwd`
echo "current dir $PWD"
cd ./opt



echo "set handle sigterm/ sigkill"
_term() { 
  echo "Caught SIGTERM signal! stop cohorte" 
  echo "stop 0" -n | /bin/nc localhost 9001
}

trap _term SIGTERM

echo "check launch_jvm.sh exists"
if [ -f ./opt/node/felix/launch/launch_jvm.sh ]; then
	echo "launch launch_jvm.sh "
	sh ./opt/node/felix/launch/launch_jvm.sh
fi

echo "start cohorte" 
#/usr/lib/systemd/systemd --system

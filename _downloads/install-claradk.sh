#!/usr/bin/env bash
# author Vardan Gyurjyan
# date 1.13.17

export CLARA_HOME=/Users/gurjyan/Testbed/clara/clara-cre

if ! [ -n "$CLARA_HOME" ]; then
    echo "CLARA_HOME environmental variable is not defined. Exiting..."
    exit
fi


command_exists () {
    type "$1" &> /dev/null ;
}

if ! command_exists git ; then
echo "Can not run git. Exiting..."
exit
fi

rm -rf clara-dk

echo "Creating clara working directory ..."
mkdir clara-dk
cd clara-dk

echo "Downloading and building xMsg package ..."
git clone --depth 1 https://github.com/JeffersonLab/xmsg-java.git
cd xmsg-java
./gradlew install

cd ..
echo "Downloading and building jinflux package ..."
git clone --depth 1 https://github.com/JeffersonLab/JinFlux.git
cd JinFlux
./gradle deploy

cd ..
echo "Downloading and building clara-java package ..."
git clone --depth 1 https://github.com/JeffersonLab/clara-java.git
cd clara-java
./gradlew install
./gradlew deploy


cd ..
echo "Downloading jre packages ..."
rm -rf $CLARA_HOME/clara-cre/jre
mkdir $CLARA_HOME/clara-cre/jre

OS="`uname`"
case $OS in
  'Linux')
      MACHINE_TYPE=`uname -m`
      if [ ${MACHINE_TYPE} == 'x86_64' ]; then
    wget https://userweb.jlab.org/~gurjyan/clara-cre/linux-64.tar.gz
    mv linux-64.tar.gz $CLARA/clara-cre/jre
  else
     wget https://userweb.jlab.org/~gurjyan/clara-cre/linux-i586.tar.gz
    mv linux-i586.tar.gz $CLARA_HOME/clara-cre/jre
  fi
    ;;
#  'WindowsNT')
#    OS='Windows'
#    ;;
  'Darwin')
 curl "https://userweb.jlab.org/~gurjyan/clara-cre/macosx-64.tar.gz" -o macosx-64.tar.gz
    mv macosx-64.tar.gz $CLARA_HOME/clara-cre/jre
    ;;
  *) ;;
esac

mkdir $CLARA_HOME/clara-cre/plugins

echo "Installing jre ..."
cd $CLARA_HOME/clara-cre/jre
tar xvzf *.tar.*
rm -f *.tar.*

echo `pwd`
echo done
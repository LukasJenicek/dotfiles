#!/bin/bash

echo "Try to install tilix"
if dpkg -l | grep -q tilix ; then
    echo "Tilix is already installed"
  else
    apt install tilix
    echo "Command succeeded"
fi

apt install git
apt install meld
apt install -s git=1:2.25.1-1ubuntu3.1 -V
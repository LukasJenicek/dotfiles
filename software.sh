#!/bin/bash

echo "Try to install tilix"
if dpkg -l | grep -q tilix ; then
    echo "Tilix is already installed"
  else
    apt install tilix
    echo "Command succeeded"
fi
#!/bin/bash

echo "copy tilix configuration to $HOME/tilix.json"
cp tilix/tilix.json $HOME/tilix.json
echo "if you want to set shortcut for using tilix with this configuration"
echo "just set tilix --session=$HOME/tilix.json to your desired keyboard shortcut"

echo "copy gitconfig to home directory"
cp .gitconfig $HOME/.gitconfig

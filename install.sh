#!/bin/bash

function doIt() {
	rsync --exclude ".git/" \
		--exclude "install.sh" \
		--exclude "software.sh" \
		--exclude ".idea/" \
		-avh --no-perms . ~;

	source ~/.bash_profile;
}

# shellcheck disable=SC2166
if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;

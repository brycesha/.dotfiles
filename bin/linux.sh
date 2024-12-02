#!/bin/bash

if [[ $(uname) != "Linux" ]]; then
	echo "Error: OS is not Linux." >> linuxsetup.log
	exit 1
fi

mkdir -p ~/.TRASH

if [[ -f ~/.nanorc ]]; then
	mv ~/.nanorc ~/.bup_nanorc
	echo "Renamed .nanorc to .bup_nanorc" >> linuxsetup.log
fi

cp ~/.dotfiles/etc/nanorc ~/.nanorc

if ! grep -Fxq "source ~/.dotfiles/etc/bashrc_custom" ~/.bashrc; then
	echo "source ~/.dotfiles/etc/bashrc_custom" >> ~/.bashrc
fi

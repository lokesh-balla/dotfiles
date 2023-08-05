#!/bin/zsh

if ! command -v git &>/dev/null; then
	echo " GIT is required for installtion"
	exit 1
fi

download_path="/tmp/dotfiles"

# Download the repo in tmp directory
git clone --depth 1 https://github.com/Lokesh-Balla/dotfiles.git ${download_path} || {
	echo >&2 "failed with $?"
	exit 1
}

# Backup existing zshrc if it exists
if [ -e ${HOME}/.zshrc ]; then
	mv ${HOME}/.zshrc "${HOME}/.zshrc.bakup$(date "+%Y-%m-%d")"
fi

# clean up old configs directory
rm -rf ${HOME}/.zshrc ${HOME}/.zsh_user_configs

# Copy Config from repo to ${HOME}
cp ${download_path}/.zshrc ${HOME}/.zshrc
cp -r ${download_path}/.zsh_user_configs ${HOME}/.zsh_user_configs

# Download all the configs 
sh ${HOME}/.zsh_user_configs/update_plugins.sh

# Clean Up
rm -rf ${download_path}

# Setting ZSH as default shell
chsh -s $(which zsh)
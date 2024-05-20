#!/bin/zsh

# create directories for plugins if required
mkdir -p ${HOME}/.zsh_user_configs/themes && mkdir -p ${HOME}/.zsh_user_configs/plugins
export ZSH_PLUGINS_PATH="${HOME}/.zsh_user_configs/plugins"

# remove all the old repos
rm -rf ${ZSH_PLUGINS_PATH}/*

# All the repos to clone
# syntax must be "{repo_path} {folder_name}"
repos=(
	"https://github.com/woefe/git-prompt.zsh.git git-prompt"
	"https://github.com/zsh-users/zsh-syntax-highlighting.git zsh-syntax-highlighting"
	"https://github.com/zsh-users/zsh-autosuggestions.git zsh-autosuggestions"
	"https://github.com/zsh-users/zsh-completions.git zsh-completions"
	"https://github.com/ael-code/zsh-colored-man-pages.git colored-man-pages"
)

for repo in "${repos[@]}"; do
    repo_path=$(echo ${repo} | cut -d' ' -f1)
    repo_name=$(echo ${repo} | cut -d' ' -f2)

    git clone --depth=1 ${repo_path} ${ZSH_PLUGINS_PATH}/${repo_name}
done

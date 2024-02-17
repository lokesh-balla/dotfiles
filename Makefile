all:
	zshell
	nvim

nvim:
	mkdir -p ${HOME}/.config/nvim
	stow --dir ${PWD}/.config/nvim --target ${HOME}/.config/nvim .

zshell:
	mkdir -p ${HOME}/.zsh_user_configs
	stow --dir ${PWD}/zsh --target ${HOME} .
	zsh ${HOME}/.zsh_user_configs/update_plugins.sh

clean_nvim:
	stow -D --dir ${PWD}/.config/nvim --target ${HOME}/.config/nvim . 
	rm -rf ${HOME}/.config/nvim
	rm -rf ${HOME}/.local/share/nvim
	rm -rf ${HOME}/.local/state/nvim
	rm -rf ${HOME}/.cache/nvim
	
clean_zshell:
	stow -D --dir ${PWD}/zsh --target ${HOME} .
	rm -rf ${HOME}/.zsh_user_configs

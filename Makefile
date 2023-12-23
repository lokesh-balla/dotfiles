config:
	stow --dir ${PWD}/.config --target ${HOME}/.config .

clean:
	stow -D --dir ${PWD}/.config --target ${HOME}/.config . 
	rm -rf ${HOME}/.config/nvim
	rm -rf ${HOME}/.local/share/nvim
	rm -rf ${HOME}/.local/state/nvim
	rm -rf ${HOME}/.cache/nvim

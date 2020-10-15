SHELL=/bin/bash -euxo pipefail

.DELETE_ON_ERROR:

init:
	echo "INIT dotfiles..."
	sudo apt update && sudo apt install curl wget zsh vim tmux make -y
	sudo chsh -s /bin/zsh
	curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh | bash -
	curl -L git.io/antigen > antigen.zsh
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim && vim +PluginInstall +qall
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
	rm ${HOME}/.zshrc
	ln -s vimrc ${HOME}/.vimrc
	ln -s zshrc ${HOME}/.zshrc
	ln -s gitconfig ${HOME}/.gitconfig
	ln -s tmux.conf ${HOME}/.tmux.conf
	cp zsh_history ${HOME}/.zsh_history

push:
	echo "Updating dotfiles..."
	cp ${HOME}/.zsh_history zsh_history
	git add -A && git commit -am "`date` update" && git push

pull:
	echo "Pulling dotfiles..."
	git pull
	cp zsh_history ${HOME}/.zsh_history

dele:

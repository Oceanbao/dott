SHELL=/bin/bash -euxo pipefail

.DELETE_ON_ERROR:

init:
	echo "INIT dotfiles..."
	sudo apt update && sudo apt install curl wget zsh vim tmux make -y
	curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh | bash -
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
	git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
	rm ${HOME}/.zshrc
	ln -s dott/vimrc ${HOME}/.vimrc
	vim +PluginInstall +qall
	ln -s dott/zshrc ${HOME}/.zshrc
	ln -s dott/gitconfig ${HOME}/.gitconfig
	ln -s dott/tmux.conf ${HOME}/.tmux.conf
	cp zsh_history ${HOME}/.zsh_history
	sudo chsh -s /bin/zsh


push:
	echo "Updating dotfiles..."
	cp ${HOME}/.zsh_history zsh_history
	git add -A && git commit -am "`date` update" && git push

pull:
	echo "Pulling dotfiles..."
	git pull
	cp zsh_history ${HOME}/.zsh_history

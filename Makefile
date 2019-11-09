DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

install: install-zsh install-fonts install-alacritty install-tmux install-misc

install-misc:
	apt install neofetch
	wget -P $HOME/Downloads https://github.com/smallhadroncollider/taskell/releases/download/1.7.1/taskell-1.7.1_x86-64-linux.deb
	apt install $HOME/Downloads/taskell-1.7.1_x86-64-linux.deb

install-zsh:
	apt install zsh
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	ln -s -f $DIR/zsh/.zshrc $HOME

install-fonts:
	cp $DIR/alacritty/fonts/* /usr/local/share/fonts
	fc-cache -f -v
	apt install fonts-firacode

install-alacritty: install-fonts
	add-apt-repository ppa:mmstick76/alacritty
	apt install alacritty

install-tmux:
	ln -s -f $DIR/tmux/.tmux/.tmux.conf $HOME
	ln -s -f $DIR/tmux/.tmux.conf.local $HOME

update-submodules:
	git submodule update --recursive


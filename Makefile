DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

VERSION_EXA     := 0.9.0
VERSION_TASKELL := 1.7.1

ADD_APT_REPO := sudo add-apt-repository -y

install: install-neovim install-exa install-zsh install-fonts install-alacritty install-tmux install-misc

home-bin:
	mkdir -p $(HOME)/bin

install-lazygit:
	$(ADD_APT_REPO) ppa:lazygit-team/release
	sudo apt-get update
	sudo apt-get install lazygit

install-neovim:
	$(ADD_APT_REPO) ppa:neovim-ppa/stable
	sudo apt-get update
	sudo apt-get install neovim

install-exa: home-bin
	wget -P $(HOME)/Downloads https://github.com/ogham/exa/releases/download/v$(VERSION_EXA)/exa-linux-x86_64-$(VERSION_EXA).zip
	unzip -o $(HOME)/Downloads/exa-linux-x86_64-$(VERSION_EXA).zip exa-linux-x86_64 -d $(HOME)/Downloads
	mv $(HOME)/Downloads/exa-linux-x86_64 $(HOME)/bin/exa

install-misc:
	apt install neofetch
	wget -P $(HOME)/Downloads https://github.com/smallhadroncollider/taskell/releases/download/$(VERSION_TASKELL)/taskell-$(VERSION_TASKELL)_x86-64-linux.deb
	apt install $(HOME)/Downloads/taskell-$(VERSION_TASKELL)_x86-64-linux.deb

install-zsh:
	apt install zsh
	sh -c "$$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	ln -s -f $(DIR)/zsh/.zshrc $(HOME)

install-fonts:
	sudo cp $(DIR)/alacritty/fonts/* /usr/local/share/fonts
	fc-cache -f -v
	apt install fonts-firacode

install-alacritty: install-fonts
	$(ADD_APT_REPO) ppa:mmstick76/alacritty
	apt update
	apt install alacritty

install-tmux:
	ln -s -f $(DIR)/tmux/.tmux/.tmux.conf $(HOME)
	ln -s -f $(DIR)/tmux/.tmux.conf.local $(HOME)

update-submodules:
	git submodule update --recursive

install-vscodium:
	wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | sudo apt-key add -
	echo 'deb https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/repos/debs/ vscodium main' | sudo tee --append /etc/apt/sources.list.d/vscodium.list
	apt update
	apt install codium
	codium --install-extension arcticicestudio.nord-visual-studio-code
	codium --install-extension yzhang.markdown-all-in-one

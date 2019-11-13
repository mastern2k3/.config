DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

DOWNLOADS := $(HOME)/Downloads

VERSION_EXA            := 0.9.0
VERSION_TASKELL        := 1.7.1
VERSION_BAT            := 0.12.1
VERSION_DOCKER_COMPOSE := 1.24.1

APT_ADD_REPO := sudo add-apt-repository -y
APT_UPDATE   := sudo apt update
APT_INSTALL  := sudo apt install

install: home-projects install-neovim install-bat install-exa install-zsh install-fonts install-alacritty install-tmux install-misc

home-bin:
	mkdir -p $(HOME)/bin

home-projects:
	mkdir -p $(HOME)/Projects

install-lazygit:
	$(APT_ADD_REPO) ppa:lazygit-team/release
	$(APT_UPDATE)
	$(APT_INSTALL) lazygit

install-neovim:
	$(APT_ADD_REPO) ppa:neovim-ppa/stable
	$(APT_UPDATE)
	$(APT_INSTALL) neovim

install-exa: home-bin
	wget -P $(DOWNLOADS) https://github.com/ogham/exa/releases/download/v$(VERSION_EXA)/exa-linux-x86_64-$(VERSION_EXA).zip
	unzip -o $(DOWNLOADS)/exa-linux-x86_64-$(VERSION_EXA).zip exa-linux-x86_64 -d $(DOWNLOADS)
	mv $(DOWNLOADS)/exa-linux-x86_64 $(HOME)/bin/exa

install-bat:
	wget -P $(DOWNLOADS) https://github.com/sharkdp/bat/releases/download/v$(VERSION_BAT)/bat_$(VERSION_BAT)_amd64.deb
	$(APT_INSTALL) $(DOWNLOADS)/bat_$(VERSION_BAT)_amd64.deb

install-misc:
	$(APT_INSTALL) htop
	$(APT_INSTALL) httpie
	$(APT_INSTALL) neofetch
	wget -P $(DOWNLOADS) https://github.com/smallhadroncollider/taskell/releases/download/$(VERSION_TASKELL)/taskell-$(VERSION_TASKELL)_x86-64-linux.deb
	$(APT_INSTALL) $(DOWNLOADS)/taskell-$(VERSION_TASKELL)_x86-64-linux.deb

install-zsh:
	$(APT_INSTALL) zsh
	sh -c "$$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	ln -s -f $(DIR)/zsh/.zshrc $(HOME)

install-fonts:
	sudo cp $(DIR)/alacritty/fonts/* /usr/local/share/fonts
	fc-cache -f -v
	$(APT_INSTALL) fonts-firacode

install-alacritty: install-fonts
	$(APT_ADD_REPO) ppa:mmstick76/alacritty
	$(APT_UPDATE)
	$(APT_INSTALL) alacritty

install-tmux:
	ln -s -f $(DIR)/tmux/.tmux/.tmux.conf $(HOME)
	ln -s -f $(DIR)/tmux/.tmux.conf.local $(HOME)

update-submodules:
	git submodule update --recursive

install-vscodium:
	wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | sudo apt-key add -
	echo 'deb https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/repos/debs/ vscodium main' | sudo tee --append /etc/apt/sources.list.d/vscodium.list
	$(APT_UPDATE)
	$(APT_INSTALL) codium
	codium --install-extension arcticicestudio.nord-visual-studio-code
	codium --install-extension yzhang.markdown-all-in-one

install-docker:
	$(APT_INSTALL) docker.io
	sudo usermod -aG docker $(USER)
	sudo curl -L "https://github.com/docker/compose/releases/download/$(VERSION_DOCKER_COMPOSE)/docker-compose-$$(uname -s)-$$(uname -m)" -o /usr/local/bin/docker-compose
	sudo chmod +x /usr/local/bin/docker-compose

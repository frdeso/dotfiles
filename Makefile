install:
	cp bashrc ~/.bashrc
	cp vimrc ~/.vimrc
	mkdir -p ~/.i3
	cp i3_config ~/.i3/config
	cp i3status.conf ~/.i3status.conf
	cp gitconfig ~/.gitconfig
	install -m 750 wallpaper ~/.wallpaper
	cp gtkrc-2.0 ~/.gtkrc-2.0
	mkdir -p ~/.config/fish/functions
	cp config.fish ~/.config/fish/
	cp -r fish_functions/* ~/.config/fish/functions/
	mkdir -p ~/.weechat/
	cp -r irc.conf ~/.weechat/
save:
	cp ~/.bashrc bashrc
	cp ~/.vimrc vimrc
	cp ~/.i3/config i3_config
	cp ~/.i3status.conf i3status.conf
	cp ~/.gitconfig gitconfig
	cp ~/.wallpaper wallpaper
	cp ~/.gtkrc-2.0 gtkrc-2.0
	cp /etc/X11/xorg.conf ./
	cp -r ~/.config/fish/functions fish_functions
	cp ~/.config/fish/config.fish config.fish
	cp ~/.weechat/irc.conf irc.conf
diff:
	diff bashrc ~/.bashrc
	diff vimrc ~/.vimrc
	diff i3_config ~/.i3/config
	diff i3status.conf ~/.i3status.conf
	diff gitconfig ~/.gitconfig
	diff gtkrc-2.0 ~/.gtkrc-2.0
	diff config.fish ~/.config/fish/

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt extendedglob notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/frdeso/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

#PS1
#Hostname color
HOSTNAME_COLOR='blue'
HOST_HASH=$(perl -e 'print crypt(`hostname`, "86"),"\n"')

#echo $HOST_HASH
if [[ "$HOST_HASH" == "86GShFbMjpaPw" ]]; then
	HOSTNAME_COLOR='green'
elif [[ "$HOST_HASH" == "865j3X/MUuPYY" ]]; then
	HOSTNAME_COLOR='yellow'
elif [[ "$HOST_HASH" == "86ufUl4nKr2i." ]]; then
	HOSTNAME_COLOR='magenta'
else
	echo $HOST_HASH
fi

autoload -U colors && colors
PS1="%{$fg[red]%}%n%{$reset_color%}@%{$fg[$HOSTNAME_COLOR]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%% "


#Alias
#ls stuff
alias ls='ls --color'
alias ll='ls -l'
alias la='ls -al'

#apt stuff
acs ()  { apt-cache search $1 }

#grep
gir ()  { grep -rin $1 ./ }

#git 
gs () { git status -s }
glog () {git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' }

aptup () {sudo apt-get update && sudo apt-get upgrade}

#Alias vim to nvim is neovim is installed
if [ -x /usr/bin/nvim ]; then
	alias vim='nvim'
fi


#set term to colors
export TERM=xterm-256color
export LANG=en_CA.UTF-8
export LC_ALL=en_US.UTF-8

source ~/.cache/p10k-instant-prompt-$USER.zsh

export ZSH=~/.oh-my-zsh
plugins=(git dirhistory npm nvm yarn sudo history alias-finder vscode zsh-autosuggestions)

ZSH_THEME="af-magic"
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UPDATE_PROMPT="true"
HIST_STAMPS="dd.mm.yyyy"
ZSH_ALIAS_FINDER_AUTOMATIC="true"

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

alias serv="ssh laptop"
alias s="serv"
alias noxus="ssh noxus"
alias cod="code --remote ssh-remote+laptop"

alias aliases="code ~/Backup/.zshrc"
alias keybinds="code ~/Backup/.xbindkeysrc"
alias backup="code ~/Backup"

alias cls="clear"

alias dc="docker-compose up -d"
alias dock="docker"
alias act="act"

alias gc="gh repo clone"
checkrepo () {
    gc $1 /tmp/temprepo
    code /tmp/temprepo
}

alias fbuild="flutter packages pub run build_runner build --delete-conflicting-outputs"
alias here="gio open . &> /dev/null"
alias drive="gio open https://drive.google.com/drive/my-drive  &> /dev/null"
alias appie="gio open https://samtaen.nl/appie  &> /dev/null"
alias wanneerwerken="gio open https://samtaen.nl/appie  &> /dev/null"

alias topdf="libreoffice --headless --convert-to pdf"

context () {
    docker build -t docker-show-context https://github.com/pwaller/docker-show-context.git
    clear
    docker run --rm -v $PWD:/data docker-show-context
}

cfadd () {
    cfcli -a -t A add $1 $(curl -4 -s ifconfig.co)
}
alias cfrm="cfcli rm"
alias cfls="cfcli ls"

alias un="sudo pacman -Rs"
alias inst="yay --noconfirm"
alias d="yay -S --noconfirm"


alias flutter="~/flutter/bin/flutter"
export PATH="$PATH:~/flutter/bin"

export EDITOR="micro"

# Keymap
bindkey "^z" undo
bindkey "^y" redo
bindkey "^H" backward-kill-word
bindkey "^d" "exit 0"

source ~/.p10k.zsh
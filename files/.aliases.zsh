alias s="ssh laptop"
alias noxus="ssh noxus"
alias cod="code --remote ssh-remote+laptop"

alias aliases="$EDITOR ~/.zshrc"

alias cls="clear"

alias ls="exa -1 -b --icons --group-directories-first"
alias lg="ls -G"
alias la="ls -a"
alias lf="la -l --octal-permissions --no-permissions --no-user --no-time"

# Docker
alias dc="docker-compose up -d --remove-orphans"
alias df="dc --force-recreate"
alias d="docker"
alias dl="d logs"

alias gc="gh repo clone"

alias fbuild="flutter packages pub run build_runner build --delete-conflicting-outputs"
alias here="gio open . &> /dev/null"

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
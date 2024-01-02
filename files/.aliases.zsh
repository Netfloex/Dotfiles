alias sun="ssh sun"
alias mars="ssh mars"
alias m="mars"
alias jupiter="ssh jupiter"
alias saturn="ssh saturn"


alias cod="code --remote ssh-remote+mars"

alias cls="clear"
alias edit="$EDITOR"

alias edc="edit docker-compose.yml"

DOTFILES_PATH=$([ -d ~/Server ] && echo ~/Server/Dotfiles || echo ~/Dotfiles)
alias aliases="edit $DOTFILES_PATH/files/.aliases.zsh"
alias zshrc="edit $DOTFILES_PATH/files/.zshrc"

alias dev="yd & sleep 1 && chromium http://localhost:3000;fg"

take () {
    mkdir -p -- "$1" &&
    cd -P -- "$1"
}

alias ls="exa -1 -b --icons --group-directories-first"
alias lg="ls -G"
alias la="ls -a"
alias lf="la -l --octal-permissions --no-permissions --no-user --no-time"

# Docker
alias d="docker"
alias dl="d logs"
alias dc="docker-compose up -d --remove-orphans"
alias df="dc --force-recreate"

alias gc="gh repo clone"

alias fbuild="flutter packages pub run build_runner build --delete-conflicting-outputs"
alias here="gio open . &> /dev/null"

alias topdf="libreoffice --headless --convert-to pdf"

context () {
    docker build -t docker-show-context https://github.com/pwaller/docker-show-context.git
    clear
    docker run --rm -v $PWD:/data docker-show-context
}


alias un="sudo pacman -Rs"

alias vsc="code ."

alias cpy="rsync -ahP"

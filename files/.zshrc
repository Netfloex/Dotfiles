source ~/.cache/p10k-instant-prompt-$USER.zsh

export ZSH=~/.oh-my-zsh
plugins=(git dirhistory npm archlinux yarn sudo docker docker-compose alias-finder vscode zsh-autosuggestions zsh-syntax-highlighting zsh-histdb)

ZSH_THEME="powerlevel10k/powerlevel10k"
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UPDATE_PROMPT="true"
HIST_STAMPS="dd.mm.yyyy"
ZSH_ALIAS_FINDER_AUTOMATIC="true"

source $ZSH/oh-my-zsh.sh

alias serv="ssh laptop"
alias s="serv"
alias noxus="ssh noxus"
alias cod="code --remote ssh-remote+laptop"

alias aliases="code ~/.zshrc"
alias keybinds="code ~/.xbindkeysrc"
alias backup="code ~/Backup"

alias cls="clear"

alias ls="exa -1 -b --icons --group-directories-first"
alias lg="ls -G"
alias la="ls -a"
alias lf="la -l --octal-permissions --no-permissions --no-user --no-time"

alias dc="docker-compose up -d"
alias dock="docker"
alias act="act"

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
export PATH="$PATH:~/flutter/bin"

export EDITOR="micro"

# Keymap
bindkey "^z" undo
bindkey "^y" redo
bindkey "^H" backward-kill-word

bindkey '^ ' autosuggest-accept

_zsh_autosuggest_strategy_histdb_top_here() {
    local query="select commands.argv from
history left join commands on history.command_id = commands.rowid
left join places on history.place_id = places.rowid
where places.dir LIKE '$(sql_escape $PWD)%'
and commands.argv LIKE '$(sql_escape $1)%'
group by commands.argv order by count(*) desc limit 1"
    suggestion=$(_histdb_query "$query")
}

ZSH_AUTOSUGGEST_STRATEGY=histdb_top_here
_BORING_COMMANDS=("^ls$" "^cd$" "^ ")


autoload -Uz add-zsh-hook

source $ZSH/custom/plugins/zsh-histdb/histdb-interactive.zsh
bindkey '^r' _histdb-isearch

source ~/.p10k.zsh

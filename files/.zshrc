source ~/.cache/p10k-instant-prompt-$USER.zsh 2> /dev/null

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

export PATH="$PATH:~/flutter/bin"

export EDITOR="micro"

source ~/.aliases.zsh

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

autoload -Uz compinit
compinit

eval "$(zoxide init zsh)"
alias cd="z"

source ~/.p10k.zsh 2> /dev/null

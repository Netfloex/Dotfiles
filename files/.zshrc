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

if [ "$TERM_PROGRAM" = "vscode" ]
then
    export EDITOR=code
else
    export EDITOR=micro
fi


source ~/.aliases.zsh
[ -f  ~/Server/files/.server-aliases.zsh ] && source ~/Server/files/.server-aliases.zsh

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

_zsh_autosuggest_strategy_atuin_here() {
    suggestion=$(atuin search --cmd-only --limit 1 -c . --search-mode prefix "$1")
}

_BORING_COMMANDS=("^ls$" "^cd$" "^ ")


autoload -Uz add-zsh-hook

source $ZSH/custom/plugins/zsh-histdb/histdb-interactive.zsh
bindkey '^s' _histdb-isearch

autoload -Uz compinit
compinit

eval "$(zoxide init zsh)"
eval "$(atuin init zsh --disable-up-arrow)"
eval "$(thefuck --alias)"

ZSH_AUTOSUGGEST_STRATEGY=(atuin_here atuin histdb_top_here completion)


source ~/.p10k.zsh 2> /dev/null
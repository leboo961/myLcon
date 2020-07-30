# Load aliases if exist
#
#bindkey -D emacs
autoload colors && colors
autoload -Uz compinit promptinit && compinit && promptinit
autoload predict-on
#
#prompt="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
#prompt+=' %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'

#zsh_theme_git_prompt_prefix="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
#zsh_theme_git_prompt_suffix="%{$reset_color%} "
#zsh_theme_git_prompt_dirty="%{$fg[blue]%}) %{$fg[yellow]%}✗"
#ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
#
if [[ -z "$SSH_CLIENT" ]]; then
    # local connection, change prompt
    #export PS1="\[\e[1;30m\]\W\[\e[m\] \\$ "
    export PS1="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ :%{reset_color%})"
else
    # ssh connection, print hostname and os version
    echo "Welcome to $HOSTNAME"
fi
# to get more information about these options
# run  man zshoptions in a terminal
set -o alwaystoend
set -o autocd
set -o autopushd
set -o completeinword
set -o extendedglob
set -o extendedhistory
set -o histexpiredupsfirst
set -o histignoredups
set -o histignorespace
set -o histverify
set -o incappendhistory
set -o interactive
set -o interactivecomments
set -o longlistjobs
set -o nobeep   #
set -o nocaseglob
set -o noflowcontrol
set -o promptsubst
set -o pushdignoredups
set -o pushdminus
set -o sharehistory
#set -o shinstdin
set -o vi       # dont like emacs
# remove emacs key binding
#bindkey -D emacs
# adding bindkey for reverse history search
bindkey "^r" history-incremental-search-backward
bindkey "^s" history-incremental-search-forward

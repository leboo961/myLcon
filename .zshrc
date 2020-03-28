
set -o alwaystoend
set -o autocd
set -o autopushd
set -o completeinword
set -o extendedhistory
set -o histexpiredupsfirst
set -o histignoredups
set -o histignorespace
set -o histverify
set -o incappendhistory
set -o interactivecomments
set -o interactive
set -o longlistjobs
set -o nobeep   #
set -o noflowcontrol
set -o promptsubst
set -o pushdminus
set -o sharehistory
#set -o shinstdin
set -o vi       # dont like emacs
#
prompt="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
prompt+=' %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'

#zsh_theme_git_prompt_prefix="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
#zsh_theme_git_prompt_suffix="%{$reset_color%} "
#zsh_theme_git_prompt_dirty="%{$fg[blue]%}) %{$fg[yellow]%}✗"
#ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
#


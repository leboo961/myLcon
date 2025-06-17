# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# useful when using modulefiles to load/unload env variable
if command -v module >/dev/null 2>&1; then
    case "$0" in
        -sh|sh|*/sh)	modules_shell=sh ;;
        -ksh|ksh|*/ksh)	modules_shell=ksh ;;
        -zsh|zsh|*/zsh)	modules_shell=zsh ;;
        -bash|bash|*/bash)	modules_shell=bash ;;
    esac
    [[ -f /etc/modules/init/bash ]] && . /etc/modules/init/bash
    #module() { eval `/usr/bin/tclsh /usr/local/Modules/libexec/modulecmd.tcl $modules_shell $*`; }

    module use /usr/local/modulefiles
fi
# don't put duplicate lines or lines starting with space in the history.
# ignorespace & ignoredups
HISTCONTROL=ignoreboth:erasedups
HISTIGNORE='ls*:cd*:pwd:history*'
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# Custom PATH
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# load aliases if available
[ -f ~/.bash_aliases ] && . ~/.bash_aliases
# aliases to avoid making mistakes:
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias df='df -h'     # human-readable sizes
alias free='free -m' # show sizes in MB
alias vp='vim -w PKGBUILD'
alias more=less

# some more ls aliases
export LS_OPTIONS='--color=auto'
alias ll='ls $LS_OPTIONS -alF'
alias la='ls $LS_OPTIONS -A'
alias l='ls $LS_OPTIONS -CF'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

#
# enable complete for command and filenames when using sudo
complete -cf sudo
# use vi keybindings
set -o vi

# a command name that is the name of a directory is executed
# as if it were the argument to the cd command
shopt -s autocd
# minor errors in the spelling of a directory component in a cd command will be
# corrected.
shopt -s cdspell
# bash checks that a command found in the hash table exists before trying to execute it.
# If a hashed command no longer exists, a normal path search is performed.
shopt -s checkhash
# check if jobs are running before exit.
# exit is deferred until a second exit is attempted
shopt -s checkjobs
# Enable checkwinsize so that bash will check the terminal size when
shopt -s checkwinsize
# bash attempts to save all lines of a multiple-line command in the same history entry
shopt -s cmdhist
# Bash replaces directory names with the results of word expansion when
# performing filename completion
shopt -s direxpand
# Bash attempts spelling correction on directory names during word completion
# if the directory name initially supplied does not exist
shopt -s dirspell
shopt -s expand_aliases
# the pattern ‘**’ used in a filename expansion context will match all files
# and zero or more directories and subdirectories. If the pattern is followed
# by a ‘/’, only directories and subdirectories match.
shopt -s globstar
# Enable history appending instead of overwriting.  #139609
shopt -s histappend
# user reedit failed history substitution
shopt -s histreedit
# loaded to a buffer to edit before
shopt -s histverify
# case insensitive globbing
shopt -s nocaseglob
shopt -s nocasematch
# allows patterns which match no files to expand to a null string
shopt -s nullglob

# enable programmable completion features if ! shopt -oq posix; then
# [ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Enable color support
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi


# Change the window title of X terminals
case ${TERM} in
	xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
		;;
	screen*)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
		;;
esac

# Function to get current Git branch
parse_git_branch() {
  git rev-parse --abbrev-ref HEAD 2>/dev/null | xargs -I {} echo "({})"
}

# Function to show chroot name if set
chroot_name() {
  [[ -n "$debian_chroot" ]] && echo "($debian_chroot)"
}

# Set Gruvbox colors
COLOR_RESET='\[\e[0m\]'
COLOR_USER='\[\e[38;5;142m\]'      # Olive green
COLOR_ROOT='\[\e[38;5;167m\]'      # Bright red
COLOR_HOST='\[\e[38;5;66m\]'       # Soft blue
COLOR_PATH='\[\e[38;5;108m\]'      # Aqua
COLOR_GIT='\[\e[38;5;208m\]'       # Bright orange
COLOR_CHROOT='\[\e[38;5;175m\]'    # Bright purple

# Set PS1
if [[ $EUID -eq 0 ]]; then
  USER_COLOR=$COLOR_ROOT
else
  USER_COLOR=$COLOR_USER
fi
PS1=''
[[ -n "$debian_chroot" ]] && PS1='${COLOR_CHROOT}$(chroot_name)${COLOR_RESET}'
PS1+="${USER_COLOR}\u${COLOR_RESET}@${COLOR_HOST}\h${COLOR_RESET} "
PS1+="${COLOR_PATH}\w${COLOR_RESET} "
PS1+="${COLOR_GIT}\$(parse_git_branch)${COLOR_RESET}\$ "

# Add SSH info if connected via SSH
[[ -n "$SSH_CONNECTION" ]] && PS1+="${COLOR_GIT}SSH${COLOR_RESET}]\$ "


# fzf settings and keybindings
# Check if fzf is installed
if command -v fzf >/dev/null 2>&1; then
  # Key bindings (Ctrl+R and others)
  [ -f ~/.fzf.bash ] && source ~/.fzf.bash
  [ -f /usr/share/doc/fzf/examples/key-bindings.bash ] && source /usr/share/doc/fzf/examples/key-bindings.bash

  # Use fzf for Ctrl+R to search through command history
  bind '"\C-r": " \C-e\C-u`__fzf_history__`\e\C-e\er"'

  # Custom fzf command for file and directory completion
  _fzf_complete() {
    _fzf_complete --reverse --multi --preview 'cat {}' --preview-window=down:3:wrap --height 40% "$@" < <(
      find . \( -path '*/\.*' -o -fstype 'sysfs' -o -fstype 'proc' \) -prune \
      -o -type f -print 2> /dev/null | sed 's/^..//'
    )
  }

  _fzf_complete_post() {
    awk '{print $NF}'
  }

  bind -x '"\C-f": fzf-file-widget'

  # Optional: FZF default options, including file preview with bat
  # Ensure bat is installed for this to work

  export BAT_THEME='gruvbox-dark'
  export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --preview "batcat --style=numbers --color=always {} | head -500"'
fi

# Git branch with fzf
fbr() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<<"$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //")
}


#bindings
bind -x '"\C-l": clear'

# functions
# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}


colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}

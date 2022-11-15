# If not running interactively, then don't do anything.
case $- in
    *i*) ;;
      *) return;;
esac

# Enable coloring (term).
TERM=xterm-color

# Set the default editor to NVIm.
export EDITOR=nvim
export VISUAL=$EDITOR

# Don't append to the history:
## 1. duplicate lines or,
## 2. lines starting with space.
##
HISTCONTROL=ignoreboth

# Append to the history file (no override).
shopt -s histappend

# Limit filesize and history length
HISTSIZE=1000
HISTFILESIZE=4000

#
## Check the window values LINES and COLUMNS after each command
## (and update them if required).
shopt -s checkwinsize

# Enable globbing (e.g., '**/foo').
shopt -s globstar

# This makes less friendlier to non-text input files.
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Set the variable identifying the chroot you work in.
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

## Prompt UI for user.
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

unset color_prompt force_color_prompt

## Enable color support for ls
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

### Display colored gcc warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'


if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Faster tabbing into dirs using cdable_vars
# http://stackoverflow.com/a/32472557
alias show='cat ~/.dirs'
save () {
    here=`pwd`
    if (( $# == 0 )); then
        name=`basename $here`
    elif (( $# > 1 )); then
        echo "usage: save [<name>]"
        return -1
    else
        name=$1
    fi
    sed -i -e "/^$name=/d" "$HOME/.dirs"
    echo "$name=\"$here\"" >> "$HOME/.dirs"
	[[ -s "$HOME/.dirs" ]] && source "$HOME/.dirs"
}
[[ -s "$HOME/.dirs" ]] && source "$HOME/.dirs"
shopt -s cdable_vars


# Set PATH so it includes the user's private bin (if it exists).
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
if [ -d "$HOME/.bin" ] ; then
    PATH="$HOME/.bin:$PATH"
fi
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# FZF
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"
source /usr/share/doc/fzf/examples/key-bindings.bash

# Fancy prompt: get current branch in git repo
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[\e[01;91m\]\w\`parse_git_branch\`\[\e[01;37m\] 𝛹 \[\e[0m\] "

## NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/pietro/google-cloud-sdk/path.bash.inc' ]; then . '/home/pietro/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/pietro/google-cloud-sdk/completion.bash.inc' ]; then . '/home/pietro/google-cloud-sdk/completion.bash.inc'; fi

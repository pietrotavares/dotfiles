# IntelliJ IDEA
alias idea='~/.local/bin/idea/bin/idea.sh & 2>&1 >> /dev/null ; exit'

# Neovim
alias vi='emacsclient -nw'
alias vim='emacsclient -nw'
alias nvim='emacsclient -nw'

# Navigation
alias ..='cd ..'
alias ...='cd ../..'

# Better grep coloring
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias untargz='tar xvzf'
alias untarbz='tar xvjf'

# Enable second monitor
alias monitor_right_up='xrandr --output HDMI-2 --auto --right-of eDP1'
alias monitor_left_up='xrandr --output HDMI-2 --auto --left-of eDP1'

# Fix broken apt-get update
alias fix_aptupdate='sudo rm /var/lib/apt/lists/* -vf && sudo apt-get clean'

# Simple time/date printing utils
alias now='date +"%T"'
alias nowdate='date +"%d-%m-%Y"'

# Copy files with rsync (way faster, useful when dealing with large stuff)
alias copy="rsync --progress -ravz"

# View permissions in numeric notation
alias chview="stat -c %a"

# Set github settings for current .git as pietrotavares
alias github_config='git config user.name "pietrotavares" && git config user.email "pietrotavares@users.noreply.github.com" && git config push.default simple'

# Tell xclip to use the system clipboard
if [[ $(which xclip) ]]; then
  alias clip='xclip -sel clip <'
fi

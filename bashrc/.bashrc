#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias grep='grep --color=auto'
alias fzfcd='cd "$(find . -type d | fzf)"'

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

# PS1='\e[0;36m\][\u@\h \w ]\e[0m\] $ '
PS1="\[\e[10;36m\][\u@\h] \w $ \[\e[m\]"

export CARGO_BIN=$HOME/.cargo/bin
export PATH=$PATH:$CARGO_BIN
export PATH="/home/rish/.local/bin:$PATH"

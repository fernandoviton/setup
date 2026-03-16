# ~/.bashrc - Git Bash on Windows

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ---- Path ----
export PATH="$HOME/bin:$PATH"

# ---- Aliases ----
alias ll='ls -alF --color=auto'
alias la='ls -A --color=auto'
alias gs='git status'
alias gd='git diff'
alias gl='git log --oneline --graph --decorate -20'

# ---- History search with arrow keys ----
# Type a prefix then Up/Down to search history for matching commands
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# ---- Starship prompt ----
eval "$(starship init bash)"

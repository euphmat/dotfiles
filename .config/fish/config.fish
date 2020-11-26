# fish config
set -g theme_display_date no
set theme_color_scheme dracula

# fish 
alias fishrc="vim ~/Github/dotfiles/.config/fish/config.fish"
alias reload="source ~/Github/dotfiles/.config/fish/config.fish"

# cd
alias cdquiver="cd ~/Library/Containers/com.happenapps.Quiver/Data/Library/Application\ Support/Quiver"

# ls 
alias ll="exa -hl --git"
alias la="exa -hla --git"

# Git
alias gitl="git log --oneline --graph --color --all --decorate"
alias gs="git status"
alias gb="git branch"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gm="git merge"
alias gh="git checkout"
alias gw="git switch"
alias gl="git pull"

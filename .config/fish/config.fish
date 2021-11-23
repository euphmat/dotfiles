# fish config
set -g theme_display_date no
set theme_color_scheme dracula
set -x PATH /usr/local/bin $PATH
set PATH /opt/homebrew/bin $PATH

# fish 
alias fishrc="vim ~/Github/dotfiles/.config/fish/config.fish"
alias vimrc="vim ~/Github/dotfiles/.vimrc"
alias reload="source ~/Github/dotfiles/.config/fish/config.fish"

# cd
alias cdd="cd ~/Desktop"
alias cds="cd /Volumes/SSD"
alias dotfiles="cd /Users/euphmat/Github/dotfiles"
alias obsidian="cd /Users/euphmat/Dropbox/obsidian"

# ls 
alias ll="exa -hl --git"
alias la="exa -hla --git"

# Git
alias gs="git status"
alias gb="git branch"
alias ga="git add -A"
alias gct="git commit -m $argv"
alias gpush="git push"
alias gpull="git pull"
alias gm="git merge"
alias gh="git checkout"
alias gr="git reset"
alias gw="git switch"
alias gdt="git difftool"
alias gds="git diff --stat"
alias gl="git log --oneline --graph --color --all --decorate"
alias glns="git log --name-status --graph"
alias glo="git log --oneline --graph"

# finder
alias f="open $argv"

function got
  git status
  git add -A
  git status
  git commit -m "$argv"
  git status
  git push
  git status
end

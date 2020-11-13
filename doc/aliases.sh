# ======================================================================
# ls 
# ======================================================================
alias ls='ls -F --color=auto --show-control-chars'
alias ll='ls -l' 
alias la='ls -la'

# ======================================================================
# cd 
# ======================================================================
alias ..='cd ..'
alias cdd='cd ~/Desktop/'
alias cds='cd ~/Github/TIL/Shelf'

# ======================================================================
# Git
# ======================================================================
alias gs="git status"
alias gb="git branch"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gm="git merge"
alias gw="git switch"
alias gl="git pull"

function gh(){
        local arg=$1
        git checkout -b $arg
        git push --set-upstream origin $arg
}
function gcl(){
        local arg=$1
        git clone https://github.com/euphmat/$arg
}

function got(){
        git add -A
        git commit -m "$*"
        git push origin HEAD
}

# ======================================================================
# mdbook
# ======================================================================
alias mdb='~/Github/TIL/build.sh'
alias mdi='mdbook init'
alias mds='mdbook serve'
# ======================================================================
# Other
# ======================================================================
alias reload='source ~/Desktop/Data/apps/cmder-full/current/vendor/git-for-windows/etc/profile.d/aliases.sh'
alias bashrc='vi ~/Desktop/Data/apps/cmder-full/current/vendor/git-for-windows/etc/profile.d/aliases.sh'
alias bashrcpath='e ~/Desktop/Data/apps/cmder-full/current/vendor/git-for-windows/etc/profile.d/'
alias vimrc='vi ~/_vimrc'
alias bat='bat --paging=never'
alias e='explorer'

# ======================================================================
# Cmder
# ======================================================================

case "$TERM" in
xterm*)
	# The following programs are known to require a Win32 Console
	# for interactive usage, therefore let's launch them through winpty
	# when run inside `mintty`.
	for name in node ipython php php5 psql python2.7
	do
		case "$(type -p "$name".exe 2>/dev/null)" in
		''|/usr/bin/*) continue;;
		esac
		alias $name="winpty $name.exe"
	done
	;;
esac

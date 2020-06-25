#!/usr/bin/env bash
set -ue

link_to_homedir()
{
	local script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
	local dotdir=$(dirname ${script_dir})
	if [[ "$HOME" != "$dotdir" ]];then
		for f in $dotdir/.??*; do
			[[ `basename $f` == ".git" ]] && continue
			if [[ -L "$HOME/`basename $f`" ]];then
				command rm -f "$HOME/`basename $f`"
			fi       
			if [[ -e "$HOME/`basename $f`" ]];then
				command mv "$HOME/`basename $f`" "$HOME/.dotbackup"
			fi
			command ln -snf $f $HOME
		done
	else
		command echo "same install src dest"
	fi
}

link_to_homedir
command echo -e "Install completed!!!!"


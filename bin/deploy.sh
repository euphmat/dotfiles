#!/usr/bin/env bash
set -ue

command echo -e "🏃 Started Deploying..."
link_to_homedir()
{
	local script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
	local dotdir=$(dirname ${script_dir})
	if [[ "$HOME" != "$dotdir" ]];then
		for f in $dotdir/.??*; do
			[[ `basename $f` == ".git" ]] && continue
			[[ `basename $f` == ".gitignore" ]] && continue
			if [[ -L "$HOME/`basename $f`" ]];then
				command rm -f "$HOME/`basename $f`"
				command echo "🔥 Delete: "$HOME/`basename $f`""
			fi       
			command ln -snf $f $HOME
			command echo "✏️  Create: $f $HOME"
		done
	else
		command echo "same install src dest"
	fi
}

link_to_homedir
command echo -e "✅ Deploy is Completed!"

#!/bin/sh

DOT_DIRECTORY=~/dotfiles

cd ${DOT_DIRECTORY}

for f in .??*
do
  # 無視したいファイルやディレクトリはこんな風に追加してね
  [[ ${f} = ".cache" ]] && continue
  [[ ${f} = ".CFUserTextEncoding" ]] && continue
  [[ ${f} = ".DS_Store" ]] && continue
  [[ ${f} = ".gitconfig" ]] && continue
  [[ ${f} = ".ssh" ]] && continue
  [[ ${f} = ".viminfo" ]] && continue
  [[ ${f} = ".vscode" ]] && continue
  [[ ${f} = ".gitignore" ]] && continue
  [[ ${f} = ".git" ]] && continue
  ln -snfv ${DOT_DIRECTORY}/${f} ${HOME}/${f}
done
echo ${DOT_DIRECTORY}
echo ${f}
echo ${HOME}
echo $(tput setaf 2)Deploy dotfiles complete!. ✔︎$(tput sgr0)

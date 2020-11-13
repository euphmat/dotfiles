#!/usr/bin/env bash
set -Ceuo pipefail

function main(){
        check_os
        install_git
        config_git
}

function install_git(){
        if type git > /dev/null 2>&1; then
                echo "Git is Installed."
        else
                if [[ $os == "MacOS" ]]; then
                        brew install git
                elif [[ $os == "Windows" ]]; then
                        scoop install git
                else
                        echo "Unknown OS"
                fi
        fi
}

function config_git(){
  if [[ -d ~/.ssh/ ]]; then
        echo "既にセットアップは完了しています。再度実施する場合は.sshフォルダを削除してから実行してください。"
  else
        git config --global user.name euphmat
        git config --global user.mail euphmat@gmail.com
        mkdir ~/.ssh
        if [[ $os == "MacOS" ]]; then
                chmod 700 ~/.ssh
                chmod 600 ~/.ssh/*
        fi
        ssh-keygen -t ed25519 -N "" -f ~/.ssh/github -C euphmat@gmail.com
        if [[ $os == "MacOS" ]]; then
                pbcopy < ~/.ssh/gituhb.pub
        fi
        echo -e "Host *" >> ~/.ssh/config
        echo -e "\tStrictHostKeyChecking no" >> ~/.ssh/config
        echo -e "\tUserKnownHostsFile /dev/null" >> ~/.ssh/config
        echo -e "\tServerAliveInterval 15" >> ~/.ssh/config
        echo -e "\tServerAliveCountMax 30" >> ~/.ssh/config
        echo -e "\tAddKeysToAgent yes" >> ~/.ssh/config
        echo -e "\tUseKeychain yes" >> ~/.ssh/config
        echo -e "\tIdentitiesOnly yes" >> ~/.ssh/config
        echo -e "" >> ~/.ssh/config
        echo -e "Host github.com" >> ~/.ssh/config
        echo -e "\tHostName github.com" >> ~/.ssh/config
        echo -e "\tIdentityFile /Users/euphmat/.ssh/github" >> ~/.ssh/config
        echo -e "\tUser git" >> ~/.ssh/config
        echo -e "\tLogLevel QUIET" >> ~/.ssh/config
        git config --global core.filemode false
        git config --global core.ignorecase false 
        git config --global core.quotepath false 
        git config --global core.precomposeunicode true
        git config --global color.ui true
        git config --global color.diff auto
        git config --global color.status auto
        git config --global color.branch auto
        echo "gitの初期設定が完了しました。Githubへ鍵を登録してください。"
        echo "登録完了後、ssh -T github.com を入力し、疎通確認を実施してください。"
        if [[ $os == "MacOS" ]]; then
                open https://github.com/settings/keys
        elif [[ $os == "Windows" ]]; then
                start https://github.com/settings/keys
        fi
  fi
}

function check_os(){
        if [[ "$OSTYPE" == "darwin" ]]; then
                os="MacOS"
        elif [[ "$OSTYPE" == "msys" ]]; then
                os="Windows"
        else
                os="Unknown"
        fi
}

main

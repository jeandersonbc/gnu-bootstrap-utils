#!/bin/bash
setup_ssh() {
    local user_email="$2"
    local output_file="$HOME/.ssh/$KEY_FILE"
    echo $output_file | ssh-keygen -b 4096 -t rsa -C "$user_email"
    echo $output_file | ssh-add
}

setup_credentials() {
    local user_name=$1
    local user_email=$2

    git config --global user.name "$user_name"
    git config --global user.email "$user_email"
}

download_git() {
    sudo apt-get -y update
    sudo apt-get install -y git
}

init() {
    local path=`which git`
    if [ -z $path ]; then
        download_git
    fi
}

if [[ -z "$1" || -z "$2" ]]; then
    echo "Usage: ./setup_git \"Your Name\" \"your@email.com\" [ OUTPUT_FILE_NAME ]"
    exit 1
fi

init
setup_credentials "$1" "$2"

KEY_FILE="id_rsa"
if [ ! -z "$3" ]; then
    KEY_FILE="$3"
fi
if [ ! -f "$HOME/.ssh/$KEY_FILE" ]; then
    setup_ssh "$2"
fi

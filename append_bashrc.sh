#!/bin/bash
existing_line=`cat $HOME/.bashrc | grep my_profile`
if [ -z "$existing_line" ]; then
    path=`pwd`
    echo ". $path/my_profile.sh" >> $HOME/.bashrc
else
    echo "Reference already exists on .bashrc"
fi

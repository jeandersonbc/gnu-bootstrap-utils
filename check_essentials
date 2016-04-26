#!/bin/bash
check_commands=(

    # Development Essentials
    "mvn"
    "java"
    "javac"
    "git"

    # Powerful editors
    "atom"
    "vim"

    # Communications
    "skype"
)
for cmd in ${check_commands[@]}; do
    path=`which $cmd`
    if [ -z "$path" ]; then
        missing_commands="- $cmd\n$missing_commands"
    fi
done
if [ ! -z "$missing_commands" ]; then
    echo "Consider installing the following tools:"
    echo -e $missing_commands
fi

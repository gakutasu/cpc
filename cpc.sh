#!/bin/bash

# Copy the last N commands and their outputs to the clipboard
cpc() {
    if [ -z "$1" ]; then
        echo -e "\e[31mSpecify number of commands.\e[0m"
        return 1
    fi

    history -a
    history -r
    combined_output=""

    commands=$(history | grep -v "cpc" | tail -n "$1")

    while IFS= read -r line; do
        cmd=$(echo "$line" | sed -E 's/^[ ]*[0-9]+[ ]+//')
        if [ -n "$cmd" ]; then
            combined_output+="$USER@$HOSTNAME:~$ $cmd\n"
            combined_output+=$(eval "$cmd" 2>&1)
            combined_output+="\n\n"
        fi
    done <<< "$commands"

    if [ -n "$combined_output" ]; then
        echo -e "$combined_output" | xclip -selection clipboard
        echo -e "\e[32mCopied!\e[0m"
    else
        echo -e "\e[33mNo commands to copy.\e[0m"
    fi
}

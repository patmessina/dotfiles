#!/usr/bin/env zsh

# Create back up of files given
function backup {
    for file in "$@"; do
        cp "$file" "$file".backup
    done
}

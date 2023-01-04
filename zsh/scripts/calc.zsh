#!/usr/bin/env zsh

function calc {
    bc -l <<< "$@"
}

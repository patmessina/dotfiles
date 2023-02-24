#!/usr/bin/env zsh

function reset-completions {
  rm -f ~/.zcompdump; compinit
}

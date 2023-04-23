#!/usr/bin/env zsh

if command -v fzf-share > /dev/null; then
  source "$(fzf-share)/key-bindings.zsh"
  source "$(fzf-share)/completion.zsh"
else
  source /usr/share/fzf/key-bindings.zsh
  source /usr/share/fzf/completion.zsh
fi

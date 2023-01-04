#!/usr/bin/env zsh

# source /usr/share/fzf/completion.zsh
# source /usr/share/fzf/key-bindings.zsh
#
# source $DOTFILES/zsh/scripts_fzf.zsh # fzf Scripts
# _fzf_comprun() {
#     local command=$1
#     shift
#
#     case "$command" in
#         cd)           find . -type d | fzf --height 50% --border sharp --margin 5% --preview 'tree -C {} | head -n 10';;
#         *)            fzf "$@" ;;
#     esac
# }
#

# Setup fzf
# ---------
if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/opt/homebrew/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"

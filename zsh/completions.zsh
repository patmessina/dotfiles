#!/usr/bin/env zsh

# source ${DOTFILES}/zsh/plugins/zsh-completions/
fpath=(${DOTFILES}/zsh/plugins/zsh-completions/ $fpath)


zmodload zsh/complist

autoload -U compinit; compinit
_comp_options+=(globdots)

# setopt GLOB_COMPLETE      # Show autocompletion menu with globs
setopt MENU_COMPLETE        # Automatically highlight first element of completion menu
setopt AUTO_LIST            # Automatically list choices on ambiguous completion.
setopt COMPLETE_IN_WORD     # Complete from both ends of a word.

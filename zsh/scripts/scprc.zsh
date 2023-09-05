#!/usr/bin/env zsh

# scprc - scp an bashrc file to a specified server
function scprc {

  local server=$1
  local rcfile="${2:-${DOTFILES}/server/bashrc}"

  if [[ -z "${server}" ]]; then
    echo "Usage: scprc <server> [rcfile]"
    echo "  server: the server to scp the rcfile to"
    echo "  rcfile: the rcfile to scp (defaults to ${DOTFILES}/server/bashrc)"
    return 1
  fi

  scp "${rcfile}" "${server}:~/.bashrc"
  
}

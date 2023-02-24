#!/usr/bin/env zsh

function calc {
    # bc -l <<< "$@"

    precision=2

    if [[ "$1" == "-p" ]]; then
      precision=$2
      shift 2
    fi

    bc -q -l << EOF
    scale=$precision
    $*
    quit
EOF

}

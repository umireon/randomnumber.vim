#!/bin/bash

shopt -s nullglob
cd "${BASH_SOURCE%/*}" || exit 1
tests=(*.vim)

echo "TAP version 13"
echo "1..${#tests[@]}"
for i in "${!tests[@]}"; do
    if vim -esS "${tests[i]}" -c 'qall!' >"${tests[i]%.vim}.log" ; then
        echo "ok $((i+1)) - ${tests[i]}"
    else
        echo "not ok $((i+1)) - ${tests[i]}"
        if [[ -s "${tests[i]%.vim}.log" ]]; then
            printf "  ---\n  stdout: |-\n"
            awk '{ print "    "$0 }' "${tests[i]%.vim}.log"
        fi

        fail=1
    fi
    [[ ! -s "${tests[i]%.vim}.log" ]] && rm "${tests[i]%.vim}.log"
done

exit "${fail-0}"

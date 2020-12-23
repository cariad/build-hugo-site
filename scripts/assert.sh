#!/bin/bash -e

nk="\033[0;31m⨯\033[0m "  # Not OK
ok="\033[0;32m✔️\033[0m "  # OK

expect=7

path="${1:?}"
actual=$(find "${path:?}" | wc -l)

if [ ! "${actual:?}" -eq "${expect:?}" ]; then
  echo -e "${nk:?}Expected ${expect:?} files in ${path:?} but found ${actual:?}."
  exit 1
fi

echo -e "${ok:?}OK!"

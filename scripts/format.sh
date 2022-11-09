#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
set -o errtrace
(shopt -p inherit_errexit &>/dev/null) && shopt -s inherit_errexit

readonly SCRIPT_DIR
SCRIPT_DIR="$(cd -P -- "$(dirname -- "$0")" && pwd -P)"

find "$SCRIPT_DIR"/../lua -iname '*.lua' \
  -exec ~/.local/share/nvim/mason/packages/luaformatter/bin/lua-format {} -i \;

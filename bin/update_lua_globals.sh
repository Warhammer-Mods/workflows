#!/usr/bin/env bash
set -e

# Paths are relative to project root

CONFIG_FILE=${LUACHECK_CONFIG:-'.luacheckrc'}
PATHS=${PATHS:-'script'}
LUA_VENDOR_FILES=${VENDOR_PATH:-'.luarocks'}
DEBUG_ENABLED=${DEBUG_ENABLED:-'false'}

if [[ "$DEBUG_ENABLED" = 'true' ]]; then
  set -x
fi

if [[ -z "${LUA_VERSION}" ]]; then
  LUA_VERSION=5.4
fi

CUSTOM_VARS=()
if [[ "${CUSTOM_LUA_GLOBALS}" ]]; then
  for g in ${CUSTOM_LUA_GLOBALS}; do
    CUSTOM_VARS+=("${g}")
  done
fi

# get script arguments
PARAMS=""

while (( "$#" )); do
  [[ $1 == --*=* ]] && set -- "${1%%=*}" "${1#*=}" "${@:2}"
  case "$1" in
    -g|--global)
      if [ -n "$2" ] && [ ${2:0:1} != "-" ]; then
        CUSTOM_VARS+=("$2")
        shift 2
      else
        echo "Error: Argument for $1 is missing" >&2
        exit 1
      fi
      ;;
    -*|--*=) # unsupported flags
      echo "Error: Unsupported flag $1" >&2
      exit 1
      ;;
    *) # preserve positional arguments
      PARAMS="$PARAMS $1"
      shift
      ;;
  esac
done

# set positional arguments in their proper place
eval set -- "$PARAMS"

# build the list of lua globals exported
lua_globals=$(
  for f in $(
    find \
      "${LUA_VENDOR_FILES}/share/lua" \
      ${PATHS} \
      -type f -iname "*.lua" \
      -not -path "${LUA_VENDOR_FILES}/share/lua/*/luacheck/*"
  ); do 
    lua-globals --mode W --lua-version ${LUA_VERSION} $f | 
    awk -F"\t" '$1 == "write" && $2 != "" {printf "	\"%s\",\n", $2}'
  done
  
  for v in ${CUSTOM_VARS[@]}; do
    echo "	\"${v}\","
  done
)

# reformat the list of lua globals
lua_globals=$(
  sort -u <<< "${lua_globals}" | 
  sed '$ s/,\s*$//'
)

# update luacheck config
config="globals = {
${lua_globals}
}"

# matches multiline globals config
regex='s/\n*globals\s*=\s*[^\\{}]*(?:\\.[\\{}]*)*(?<!\\)(\{(?>\\.|[^{}]|(?1))*})\n*/\n/g'

for file in $CONFIG_FILE; do
  perl -0777pe ${regex} ${file} \
    > ${file}.tmp && mv ${file}.tmp ${file}
  printf '\n%s\n' "${config}" >> ${file}
done

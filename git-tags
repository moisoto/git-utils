#!/usr/bin/env zsh

show_tags() {
  local REF_FMT="%(align:18,left)%(refname:short)%(end)"
  local OTY_FMT="%(align:8,left)%(objecttype)%(end)"
  local CDT_FMT="%(creatordate:short)"
  local ONA_FMT="%(objectname:short=10)"
  local PLD_FMT="%(*objectname:short=10)"
  local HSH_FMT="%(align:width=23,position=left)$ONA_FMT%(if)%(taggerdate)%(then) → $PLD_FMT%(end)%(end)"
  local SUB_FMT="%(align:70,left)%(contents:subject)%(end)"
  local CMD

  echo "| Tag/Ref            | Type     | Date       | Hash                    | Subject                                                                |"
  echo "|--------------------|----------|------------|-------------------------|------------------------------------------------------------------------|"
  CMD=(git for-each-ref refs/tags )
  CMD+=(--sort=-creatordate )
  CMD+=(--format="| $REF_FMT | $OTY_FMT | $CDT_FMT | $HSH_FMT | $SUB_FMT |")
  if [ -n "$MAX_COUNT" ]; then
      CMD+=(--count="$MAX_COUNT")
  fi
  "${CMD[@]}"
}

chk_cnt() {
  local cnt="$1"
  local msg="$2"
  case "$cnt" in
    ''|*[!0-9]*|0)
      echo "$msg"
      exit 1
      ;;
  esac
}

# Default: show all
MAX_COUNT=""

if [ -n "$3" ]; then
    echo "Error: too many arguments"
    exit 1
fi

case "$1" in
    "")
        # No arguments → show all
        ;;

    -n)
        # Format: -n 10
        chk_cnt "$2" "Error: -n requires a positive integer greater than 0"
        MAX_COUNT="$2"
        ;;

    --max-count=*)
        # Format: --max-count=10
        VALUE="${1#*=}"
        chk_cnt "$VALUE" "Error: --max-count requires a positive integer greater than 0"
        MAX_COUNT="$VALUE"
        ;;

    --max-count)
        # Format: --max-count 10
        chk_cnt "$2" "Error: --max-count requires a positive integer greater than 0"
        MAX_COUNT="$2"
        ;;

    *)
        echo "Unknown option: $1"
        exit 1
        ;;
esac

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "Not inside a git repository"
  exit 1
fi

# Fetch and List Tags!

echo "Fetching tags..."
git fetch --tags >/dev/null 2>&1

if ! git show-ref --tags --quiet; then
    echo "No tags to list :("
    exit 0
fi

printf "\033[38;5;117mLatest References (includes tags on remote):\033[0m"
if command -v glow >/dev/null 2>&1; then
  show_tags | glow -w0
else
  echo
  show_tags
fi

#!/usr/bin/env zsh


expected_directory="git-utils"
expected_path="${HOME}/$expected_directory"
current_path="${PWD:A}"
script_name="${0:t}"

if [[ "$current_path" != "${expected_path:A}" ]]; then
  print -u2 "Error: this script must be run from ~/$expected_directory."
  print -u2 "Current directory: $current_path"
  print -u2
  print -u2 "Move the $expected_directory folder to your home directory, then run:"
  print -u2 "  cd ~/$expected_directory"
  print -u2 "  ./$script_name"
  exit 1
fi

check_existing_aliases()
{
  local alias_names=(df tt drop tags hundo)
  local existing_aliases=()
  local alias_name alias_value
  local reply

  for alias_name in "${alias_names[@]}"; do
    if git config --global --get "alias.${alias_name}" >/dev/null 2>&1; then
      existing_aliases+=("$alias_name")
    fi
  done

  # Exit if not aliases found
  (( ${#existing_aliases[@]} == 0 )) && return 0

  print "The following global Git aliases already exist:"

  for alias_name in "${existing_aliases[@]}"; do
    alias_value=$(git config --global --get "alias.${alias_name}")
    print -r -- "  ${alias_name} = ${alias_value}"
  done

  echo
  echo "Maybe from a previous version of these git-utils?"
  read "reply?May I delete these aliases? [y/N] "

  case "$reply" in
    [yY] | [yY][eE][sS])
      for alias_name in "${existing_aliases[@]}"; do
        git config --global --unset-all "alias.${alias_name}"
      done
      print "Existing aliases deleted."
      return 0
      ;;
    *)
      return 1
      ;;
  esac
}

if ! check_existing_aliases; then
  echo "Aborting due to existing aliases."
  exit 1
fi

# These commands need only be run once to configure the git aliases in your global config
# Notice the scripts are contained on ~/git-utils folder
git config --global alias.undo  'revert HEAD'
git config --global alias.cstat '-c color.ui=always status'
git config --global alias.clog  'log --pretty="format:%C(auto)%h %ad: %s" --date=short --name-only'
git config --global alias.slog  'log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --stat'

# Make sure ~/.local/bin exists
mkdir -p "$HOME/.local/bin"

# Symlink git-new-branch into ~/.local/bin
ln -sf "../../$expected_directory/git-df" "$HOME/.local/bin/git-df"
ln -sf "../../$expected_directory/git-tt" "$HOME/.local/bin/git-tt"
ln -sf "../../$expected_directory/git-drop" "$HOME/.local/bin/git-drop"
ln -sf "../../$expected_directory/git-tags" "$HOME/.local/bin/git-tags"
ln -sf "../../$expected_directory/git-new-branch" "$HOME/.local/bin/git-new-branch"

read -q "REPLY?Do you want to add the 'git hundo' alias? (y/n): "
echo # move to a new line
if [[ "$REPLY" =~ ^[Yy]$ ]] ; then
  ln -sf "../../$expected_directory/git-hundo" "$HOME/.local/bin/git-hundo"
else
  echo "Skipping alias hundo"
fi

echo # move to a new line
echo "The following git aliases are now present on your system:"
git config --global --get-regexp '^alias\.' | sed 's/^alias\.//' | awk '{print "git " $1}'
echo

echo "The following external commands are now available:"
for cmd in "$HOME"/.local/bin/git-*; do
  [[ -x $cmd ]] || continue
  print "git ${${cmd:t}#git-}"
done

# Run the following command to check your current global git configuration:
# git config --global --list

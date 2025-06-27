#!/bin/sh

# This script is used to write a conventional commit message.
# It prompts the user to choose the type of commit as specified in the
# conventional commit spec. And then prompts for the summary and detailed
# description of the message and uses the values provided. as the summary and
# details of the message.
#
# If you want to add a simpler version of this script to your dotfiles, use:
#
# alias gcm='git commit -m "$(gum input)" -m "$(gum write)"'

# if [ -z "$(git status -s -uno | grep -v '^ ' | awk '{print $2}')" ]; then
#     gum confirm "Stage all?" && git add .
# fi

if ! command -v gum &> /dev/null; then
printf "\033[38;2;255;85;85m✖ The gum utility is required to run this script.\033[0m\n" >&2
printf "\033[38;2;255;85;85m  Please install it to continue.\033[0m\n" >&2
  exit 1
fi

if ! git rev-parse --is-inside-work-tree &> /dev/null; then
  MSG="Error: You must run this command when inside a repository."
  echo "{{ Foreground \"#ff555555\" \"$MSG\" }}" | gum format -t template
  echo
  exit
fi

TYPE=$(gum choose "fix" "feat" "docs" "style" "refactor" "test" "chore" "revert")
SCOPE=$(gum input --placeholder "scope")

# Since the scope is optional, wrap it in parentheses if it has a value.
test -n "$SCOPE" && SCOPE="($SCOPE)"

# Pre-populate the input with the type(scope): so that the user may change it
SUMMARY=$(gum input --value "$TYPE$SCOPE: " --placeholder "Summary of this change")
DESCRIPTION=$(gum write --placeholder "Details of this change")

if [ -z "$SUMMARY" ] ; then
  echo "Can commit with an empty message. Aborting."
  exit
fi

echo "$SUMMARY"

if [ -n "$DESCRIPTION" ] ; then
  gum style --foreground 255 --border-foreground 255 --border normal "$DESCRIPTION"
  # Commit these changes if user confirms
  gum confirm "Commit changes?" && git commit -m "$SUMMARY" -m "$DESCRIPTION"
else 
  # Commit these changes if user confirms
  gum confirm "Commit changes?" && git commit -m "$SUMMARY"
fi

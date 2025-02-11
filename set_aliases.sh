#!/bin/zsh

# These commands need only be run once to configure the git aliases in your global config
# Notice the scripts are contained on ~/git-utils folder
git config --global alias.df   '! [ \"$GIT_PREFIX\" != \"\" ] && cd $GIT_PREFIX; ~/git-utils/git_df.sh'
git config --global alias.tt   '! [ \"$GIT_PREFIX\" != \"\" ] && cd $GIT_PREFIX; ~/git-utils/git_tt.sh'
git config --global alias.drop '! [ \"$GIT_PREFIX\" != \"\" ] && cd $GIT_PREFIX; ~/git-utils/git_drop.sh'
git config --global alias.undo 'revert HEAD'
git config --global alias.clog 'log --pretty="format:%C(auto)%h %ad: %s" --date=short --name-only'
git config --global alias.slog 'log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --stat'

read -q "REPLY?Do you want to add the 'git hundo' alias? (y/n): "
echo # move to a new line
if [[ "$REPLY" =~ ^[Yy]$ ]] ; then
   git config --global alias.hundo '! [ \"$GIT_PREFIX\" != \"\" ] && cd $GIT_PREFIX; ~/git-utils/git_hundo.sh'
else
   echo "Skipping alias hundo"
fi

echo # move to a new line
echo "The following git aliases are now present on your system:"
git config --get-regexp '^alias\.' | sed 's/^alias\.//' | awk '{print "git " $1}'

# Run the following command to check your current global git configuration:
# git config --global --list

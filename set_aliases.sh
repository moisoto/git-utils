# These commands need only be run once to configure the git aliases in your global config
# Notice the scripts are contained on ~/git-utils folder
git config --global alias.df   '! [ \"$GIT_PREFIX\" != \"\" ] && cd $GIT_PREFIX; ~/git-utils/git_df.sh'
git config --global alias.tt   '! [ \"$GIT_PREFIX\" != \"\" ] && cd $GIT_PREFIX; ~/git-utils/git_tt.sh'
git config --global alias.drop '! [ \"$GIT_PREFIX\" != \"\" ] && cd $GIT_PREFIX; ~/git-utils/git_drop.sh'
git config --global alias.clog 'log --pretty="format:%C(auto)%h %ad: %s" --date=short --name-only'

# Run the following command to check your current global git configuration:
# git config --global --list

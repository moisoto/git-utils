# These commands need only be run once to configure the git aliases in your global config
# Notice the scripts are contained on ~/git folder
git config --global alias.df '! [ \"$GIT_PREFIX\" != \"\" ] && cd $GIT_PREFIX; ~/git/git_df.sh'
git config --global alias.tt '! [ \"$GIT_PREFIX\" != \"\" ] && cd $GIT_PREFIX; ~/git/git_tt.sh'
git config --global --list

# git-utils

These are some utilities for use when working with git that may be usefull to other people.

The scripts are not intended to be called directly, they are called by git aliases you should define by running the included script called `set_aliases.sh`.

It is assumed you have the scripts located on the folder ~/git-utils (cloning the repository on your home directory will acomplish this).

## Downloading and enabling aliases

In order to use these scripts open a terminal Window and run the following commands:

```shell
cd ~/
git clone https://github.com/moisoto/git-utils.git
~/git-utils/set_aliases.sh
```

## Commands

The following sections describe what the corresponding git commands will do:

### git df

Sintax: `git df filename [filename2] ...` 

This command will output a git diff of a given file that will show the entire file instead of just the context around the file differences.

You should specify the filename(s) but it works for more than one file (you can use wilcards or list them manually).

### git tt

Sintax `git tt filename`

This will trim all trailing spaces from a given regular file.

Some editors will leave trailing spaces after the end-of-line as you format your commands, this will normally have no ill effects but when running the git diff command it will show these trailing spaces in red. This is just to let you know there are spaces there.

If it bothers you to see these ugly red marks, just use this command on your file ( yes, this command is for OCD people like me ;] ).

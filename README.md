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

Syntax: `git df filename [filename2] ...`

This command will output a git diff of a given file that will show the entire file instead of just the context around the file differences.

You should specify the filename(s) but it works for more than one file (you can use wilcards or list them manually).

### git tt

Syntax: `git tt filename`

This will trim all trailing spaces from a given regular file.

Some editors will leave trailing spaces after the end-of-line as you format your commands, this will normally have no ill effects but when running the git diff command it will show these trailing spaces in red. This is just to let you know there are spaces there.

If it bothers you to see these ugly red marks, just use this command on your file.

### git drop

Syntax: `git drop`

This will drop all changes to tracked files on the working directory.
Any uncomitted changes to tracked files will be reverted to the state of the last commit.
This includes files that are staged for commit as well as those that are modified but not staged.

### git clog

Syntax: `git clog`

My preferred format for git log. Shows filenames, the short hash & commit date.

### git undo

Syntax: `git undo`

This command will create a new commit that will effectively revert to the commit that was made before the current one.

### git hundo

Syntax: `git hundo`

This command will undo the last commit. Use with care. The working directory, the staging area and the commit history will be reset to the commit before the last one.

Do this ONLY when the commit has not been pushed to a remote. Otherwise you will have problems pushing to the remote, since the last commit on the remote will not exist in your local copy.

I'm including this here for rare cases where you don't want to have the last commit on the commit history. For most cases the use of `git undo` is STRONGLY recommended instead.

### gcommit

Syntax: `gcommit`

Use this interactive command when you want to make a commit with an additional detailed multiline description.

You will be asked for the following:

- A **_category_** for the type of change you are commiting (Fix, Feature, Documentation, Revert, etc).
- A **_scope_** (optional) to specify what you are modifying.
- A **_short description_** with more details about the change. You can enter multiple lines by pressing **crtl+j**.
- An optional **detailed description**.

After entering this information, it will be shown for review and you will be asked to confirm if you wish to perform the commit.

> **Note:**
>     This command requires gum to be installed on your system.<br>
>     Please visit https://github.com/charmbracelet/gum for more details.<br>
>     If you have homebrew on macOS it can be installed by typing `brew install gum`

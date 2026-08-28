# git-utils

These are some utilities for use when working with git that may simplify your workflow.

Some are defined as aliases, others are scripts that git will run automatically as external commands.

It is assumed you have the scripts located on the folder ~/git-utils (cloning the repository on your home directory will acomplish this).

## Setting up Git-Utils

In order to use these scripts and aliases open a terminal window and run the following commands:

```shell
cd ~/
git clone https://github.com/moisoto/git-utils.git
~/git-utils/setup-git-utils.sh
```

## Commands

The following sections describe what the corresponding git commands will do:

### git df

Syntax: `git df <filename> [<filename2>...]`

This command will output a git diff of a given file that will show the entire file instead of just the context around the file differences.

You can specify more than one file explicitly or use wilcards, however this command is most useful when reviewing a single file.

### git tt

Syntax: `git tt filename`

Trims all trailing spaces from a given regular file.

Some editors will leave trailing spaces after the end-of-line as you format your file, this will normally have no ill effects but when running the git diff command it will show these trailing spaces in red. This is just to let you know there are spaces there.

If it bothers you to see these ugly red marks, just use this command on your file.

### git drop

Syntax: `git drop`

Discards all staged and unstaged changes to tracked files across the entire repository.

Any uncomitted changes to tracked files will be reverted to the state of the last commit.
This includes files that are staged for commit as well as those that are modified but not staged.

### git clog

Syntax: `git clog`

A compact format for `git log`. Shows filenames, the short hash & commit date.

### git slog

Syntax: `git slog`

A custom `git log` with stats info and graph format.

### git cstat

Syntax: `git cstat`

A git status alias for use with `less -R`.
This will allow to keep colored output when paging the output.

For example:

```shell
git cstat | less -R
```

### git undo

Syntax: `git undo`

This command will create a new commit that will effectively revert to the commit that was made before the current one.

### git hundo

Syntax: `git hundo`

Discards the current commit by moving the current branch back by one commit
and resetting the working tree and staging area to match the previous commit.

Use with care, the changes introduced by the current commit and all uncommitted
changes to tracked files are discarded.

The command refuses to run if the current commit is found on any branch
of a configured remote. Rewriting a published branch would normally
cause a subsequent push to be rejected as non-fast-forward and could
require a force push.

This command is intended for rare cases in which the current commit should be
removed from the branch history. In most cases, preserving the existing history by
running `git undo` (an alias for `git revert HEAD`) is strongly recommended.

### git new-branch

Syntax: `git new-branch branch-name`

This command will do the following:

- Creates a new Git branch using the name provided.
- If a remote is available:
  - Creates the new branch.
  - Pushes it to the remote and configures tracking.
- If no remote is available, creates the branch locally from the current commit.

### git tags

Syntax:  `git tags`

Lists tags from the repository, including remote tags.

Tags are ordered from newest to oldest.

The number of displayed tags can be limited using the `-n` or `--max-tags` option.

For example to limit the output to the newest 5 tags:

```shell
git tags -n 5
```

### git gum-commit

Syntax:  `git gum-commit`

Alternatively you can use a shorter command: **`gcommit`**

Use this interactive command when you want to make a commit with an additional detailed multiline description.

The format used for the commit message is based on the [conventional commits specification](https://www.conventionalcommits.org/en/v1.0.0/#summary).
You will be asked for the following:

- A **_category_** for the type of change you are commiting (Fix, Feature, Documentation, Revert, etc).
- A **_scope_** (optional) to specify what you are modifying.
- A **_short description_** with more details about the change.
- An optional **_multi-line explanation_** of the change. Insert a line break by pressing **Ctrl+J**.

After the information has been entered, the complete commit message is
displayed for review. The command asks for confirmation before creating the
commit.

If the repository has a configured remote, the command also offers to push the
new commit to it.

> **Note:**
>     This command requires `gum` to be installed on your system.<br>
>     Please visit https://github.com/charmbracelet/gum for more details.<br>
>     If you have homebrew on macOS it can be installed by typing `brew install gum`

## Updating from a earlier version

A previous version of the setup used aliases to call the scripts.
If you want to update to the new scheme of external commands,
please run setup again:

```shell
# Assuming you installed this on the recommended folder
cd ~/git-utils

# Assuming you cloned the script (not a .zip download)
git pull

~/git-utils/setup-git-utils.sh
```

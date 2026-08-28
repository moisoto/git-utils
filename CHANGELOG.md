# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

No pending unreleased changes.

## [1.1.0] - 2026-08-28

### Added

- v1.1 Man page for `git-df` external command.
- v1.1 Man page for `git-drop` external command.
- v1.1 Man page for `git-gum-commit` external command.
- v1.1 Man page for `git-hundo` external command.
- v1.1 Man page for `git-new-branch` external command.
- v1.1 Man page for `git-tags` external command.
- v1.1 Man page for `git-tt` external command.

### Changed

- v1.1 Script git-df is now a git external command.
- v1.1 Script git-drop is now a git external command.
- v1.1 Script git-gum-commit (commit.sh) is now a git external command.
- v1.1 Script git-hundo is now a git external command.
- v1.1 Script git-tags is now a git external command.
- v1.1 Script git-tt is now a git external command.
- v1.1 Updated `README.md` documentation. Wording enhanced, matches man-pages.
- v1.1 Added new 'Displaying external commands help' section to `README.md`.
- v1.1 Setup script changes filename: `set_aliases.sh` -> `setup-git-utils.sh`.
- v1.1 Setup script now creates man-pages at `~/.local/share/man/man1`.
- v1.1 Setup script now symlinks all external commands scripts to `~/.local/bin`.
- v1.1 Script `setup-git-utils.sh` now only accepits running from `~/git-utils/`.
- v1.1 Script `git-hundo` now refuses to run if commit has been pushed to any repo.

## Fixed

- v1.1 Script `git-drop` has been made more secure. Uses modern syntax.

## [1.0.0] - 2026-08-26

Initial version. The scripts are mature enough and work reliably.

Added section will list the scripts and commands created since the repository was created.

### Added

- v1.0 **git cstat**: A `git status` alias for use with `less -R`.
- v1.0 **git clog**: A compact format for `git log`. Shows filenames, the short hash & commit date.
- v1.0 **git slog**: A custom `git log` with stats info and graph format.
- v1.0 **git undo**: An alias to `git revert HEAD`.
- v1.0 **git df**: Output a git diff of a given file that will show the entire file.
- v1.0 **git tt**: Trims all trailing spaces from a given regular file.
- v1.0 **git tags**: Lists tags from the repository, including remote tags.
- v1.0 **git drop**: Discards all staged and unstaged changes to tracked files across the entire repository.
- v1.0 **git hundo**: Discards the current commit by moving the current branch back by one commit.
- v1.0 **git new-branch**: Creates a new Git branch using the name provided and push it to the remote if exists.
- v1.0 **git gum-commit**: Creates an interactive Conventional Commit with a detailed description.
- v1.0 README.md file.
- v1.0 LICENSE file.
- v1.0 set-aliases.sh script.


# My dotfiles

This directory contains the dotfiles for my system (tho I copied this README from a YouTuber hehe)

## Requirements

Ensure you have the following installed on your system

### Git

```
pacman -S git
```

### Stow

```
pacman -S stow
```

## Installation

First, check out the dotfiles repo in your $HOME directory using git

```
$ git clone git@github.com:papatenko/dotfiles.git
$ cd dotfiles
```

then use GNU stow to create symlinks

```
# --adopt changes any files found on system to symlink to dotfiles directory
$ stow --adopt .
```

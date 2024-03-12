# My dotfiles

![image](./screenshot.png)

This directory contains the dotfiles for my system 

*(tho I copied this README from a YouTuber hehe)*

## Requirements

Ensure you have the following installed on your system

```
yay -S git stow konsave
```

## Installation

First, check out the dotfiles repo in your $HOME directory using git

```
git clone git@github.com:papatenko/dotfiles.git
cd dotfiles
```

then use GNU stow to create symlinks

```
# --adopt changes any files found on system to symlink to dotfiles directory
stow --adopt .
```

### KDE Settings 

Import file and apply

```
konsave -i ./konsave.knsv
konsave -a konsave
```

## Nvim

Install astronvim using their [setup guide](https://docs.astronvim.com/) or these commands

```
git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
nvim
```

my user config should already work out of the box 

### Tmux 

Source tmux config file

*(note that most of the config is sourced from a guy named [tony](https://github.com/tony/tmux-config))*

```
tmux source .tmux/.tmux.conf
```

incase plugins aren't installed, press `prefix` + `I` (yes, a capital i)

## Packages

Install all packages from pacman

```
yay -S --needed - < package-lists/pacman.txt
```

unfortunately, there's no way to install multiple packages using flatpak,
so refer to the `flatpak.txt` within package-lists/


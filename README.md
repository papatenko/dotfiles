# My dotfiles

![image](./screenshot.png)

This directory contains the dotfiles for my **I use Arch BTW** system.

## Requirements

Base Dependencies:

```bash
yay -S git stow konsave tmux nvim alacritty
```

## Installation

Download:

```bash
git clone git@github.com:papatenko/dotfiles.git
cd dotfiles
```

GNU stow to create symlinks:

```bash
# --adopt changes any files found on system to symlink to dotfiles directory
stow --adopt .
```

### KDE Settings 

Import file and apply:

```bash
konsave -i ./konsave.knsv
konsave -a konsave
```

## Nvim

Install AstroNvim:

```bash
git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
nvim
```

User config should work out of the box.

### Tmux 

Source config file:

```bash
tmux source .tmux/.tmux.conf
```

Incase plugins aren't installed, press `prefix` + <kbd>I<kbd> (yes, a capital i).

## Rest of Packages

### AUR

Install:

```bash
yay -S --needed - < package-lists/pacman.txt
```

### Flatpak

Unfortunately, there's no way to install multiple packages using flatpak.

Refer to `package-lists/flatpak.txt` for the flatpak package list.

## References
- [AstroNvim Installation Guide](https://docs.astronvim.com/)
- [Tony's Tmux Config](https://github.com/tony/tmux-config)

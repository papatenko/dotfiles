#!/bin/bash

#Lists of apps to download
pacmanApps="os-prober htop trash-cli vim libreoffice-fresh imwheel grub-customizer piper ncdu gnome-keyring libgnome-keyring imagemagick alacritty tmux tree npm cmake rclone redshift"
yayApps="onedriver pfetch snapd flatpak jdk17-openjdk rclone-bin rclone-browser pulseway-bin alacritty-themes konsave powershell-bin visual-studio-code-bin"

getYay() {
	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg -si
	cd ~
}
time-datectl set-local-rtc 1

#Arch Repos
getYay &&
	sudo pacman -Syu $pacmanApps --noconfirm &&
	yay -S $yayApps --noconfirm

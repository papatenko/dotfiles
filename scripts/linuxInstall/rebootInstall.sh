#!/bin/bash

# Lists of apps to download

flatpak="org.yuzu_emu.yuzu org.mozilla.firefox com.brave.Browser net.cozic.joplin_desktop com.todoist.Todoist com.spotify.Client com.jetbrains.PyCharm-Community"

# Repos other than Arch
su
flatpak install $flatpak

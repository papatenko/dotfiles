# ~/.bashrc
#
# Default Configeration created by EndeavourOS and changed to fit my liking.
# Many aliases were taken from https://www.freecodecamp.org/news/bashrc-customization-guide/

## Colors
blk='\[\033[00;30m\]'   # Black
red='\[\033[00;31m\]'   # Red
grn='\[\033[00;32m\]'   # Green
ylw='\[\033[00;33m\]'   # Yellow
blu='\[\033[00;34m\]'   # Blue
pur='\[\033[00;35m\]'   # Purple
cyn='\[\033[00;36m\]'   # Cyan
wht='\[\033[00;37m\]'   # White
clr='\[\033[00m\]'      # Reset

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ -f ~/.welcome_screen ]] && . ~/.welcome_screen

_set_liveuser_PS1() {
	parse_git_branch() {
	            git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
	    }

	    PS1="$cyn\w"
	    PS1+="$red\$(parse_git_branch) "
	    PS1+="$pur$ $wht"

    if [ "$(whoami)" = "liveuser" ] ; then
        local iso_version="$(grep ^VERSION= /usr/lib/endeavouros-release 2>/dev/null | cut -d '=' -f 2)"
        if [ -n "$iso_version" ] ; then
            local prefix="eos-"
            local iso_info="$prefix$iso_version"
            PS1="[\u@$iso_info \W]\$ "
        fi
    fi
}

_set_liveuser_PS1
unset -f _set_liveuser_PS1

[[ "$(whoami)" = "root" ]] && return

[[ -z "$FUNCNEST" ]] && export FUNCNEST=100          # limits recursive functions, see 'man bash'

## Use the up and down arrow keys for finding a command in history
## (you can write some initial letters of the command first).
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

## All Aliases

# Replace ls with lsd
alias ls='lsd'

# Anime related
alias animedownload='animdl download -d ~/Videos/anime/'

# Rclone related
alias mountonedrive='rclone mount onedrive:/ ~/Onedrive --vfs-cache-mode full'

# tmux commands
alias ide='tmux split-window -v -p 30 && tmux split-window -h -p 67 && tmux split-window -h && nvim .'

# Dotfiles for github
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
alias dotfiles='/usr/bin/git --git-dir=/home/justink/.dotfiles/ --work-tree=/home/justink'

# Other
alias update='sudo pacman -Syu --noconfirm && flatpak update --noninteractive'


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

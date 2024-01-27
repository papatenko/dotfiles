# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    sudo
    zsh-autosuggestions
    dirhistory
)

source $ZSH/oh-my-zsh.sh

# User configuration

# Replacements
alias g++='gcc -lstdc++'
alias ls='lsd'
alias rm='trash'

# Aliases
ipad_res="240x360_10.00"

# Rclone
alias mountonedrive='rclone mount onedrive:/ ~/Onedrive --vfs-cache-mode full'

# Tmux
alias split='tmux new-session \; split-window -h \; attach'

# Dotfiles for github
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
alias dotfiles='/usr/bin/git --git-dir=/home/justink/.dotfiles/ --work-tree=/home/justink'

# Virtual Display
alias virtdisplay='
cvt 240 360 10 ;
xrandr --newmode  $ipad_res 1.00  240 248 264 288  360 363 373 376 -hsync +vsync ;
xrandr --addmode HDMI-A-0 $ipad_res ;
xrandr --output HDMI-A-0 --mode $ipad_res --scale 3.5x3.5 --right-of eDP'
alias virtdisplayoff='xrandr --output HDMI-A-0 --off'

# Other
alias update='sudo pacman -Syyu --noconfirm && flatpak update --noninteractive'
alias turnoffscreen='sleep 0.1 && qdbus org.kde.kglobalaccel /component/org_kde_powerdevil invokeShortcut "Turn Off Screen"'
alias davincimenu='qdbus org.kde.kded5 /kded org.kde.kded5.unloadModule "appmenu" && progl /opt/resolve/bin/resolve %u & sleep 10 && qdbus org.kde.kded5 /kded org.kde.kded5.loadModule "appmenu"'
alias opendavinciresolve='progl /opt/resolve/bin/resolve'

# Other Sourced Plugins
source /home/justink/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

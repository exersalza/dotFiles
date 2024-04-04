###
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation. installation via script from github
export ZSH="$HOME/.oh-my-zsh"

if [[ "$(whoami)" != "root" ]]; then # change theme for root, so you dont have to type whoami everytime
	ZSH_THEME="robbyrussell" # darkblood, cypher
else
	ZSH_THEME="cypher" # darkblood, cypher
fi

if [[ $SSH_CONNECTION || $USER -eq "root" ]]; then
  colores=false # for the color bar
else
  colores=true
fi

COMPLETION_WAITING_DOTS="true"

plugins=(git rust python)

source $ZSH/oh-my-zsh.sh
source "${HOME}/.zgen/zgen.zsh"

PATH="$PATH:/home/julian/.cargo/bin/"
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
EDITOR='nvim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"


####   ARCOLINUX SETTINGS   ####
export PAGER='most'

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

setopt GLOB_DOTS
#share commands between terminal instances or not
#unsetopt SHARE_HISTORY
setopt SHARE_HISTORY

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTCONTROL=ignoreboth:erasedups

# Make nano the default editor
# MAKE VIM GREATER THAN NANO
export EDITOR='nvim'
export VISUAL='nvim'

# set nonworking less keybinds
export MANPAGER="less -isX"
export LESS="-i -M -R -x4"
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# drop in replacements
alias vim="$EDITOR"
alias grep="rg"

#PS1='[\u@\h \W]\$ '

if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

### ALIASES ###

#list
alias ls='exa --color=auto'
alias la='exa -a'
alias ll='exa -alFh'
alias l='exa'
alias l.="exa -A | rg '^\.'"
alias lla='exa -la'
alias vls="/usr/bin/ls" # if we have to use vanilla ls for some reason

#fix obvious typo's, OMFG
alias cd..='cd ..'
alias pdw='pwd'
alias udpate='sudo pacman -Syyu'
alias upate='sudo pacman -Syyu'
alias updte='sudo pacman -Syyu'
alias updqte='sudo pacman -Syyu'
alias upate='sudo pacman -Syyu'
alias upqll='paru -Syu --noconfirm'
alias upal='paru -Syu --noconfirm'
alias nvi='nvim'
alias nivm='nvim'
alias clera='clear'

## Colorize the grep command output for ease of use (good for log files)##
alias grep='rg --color=auto'
alias vgrep='grep --color=auto' # if we have to use vanilla grep for some reason

#readable output
alias df='df -h'

#pacman unlock
alias unlock="sudo rm /var/lib/pacman/db.lck"
alias rmpacmanlock="sudo rm /var/lib/pacman/db.lck"

#arcolinux logout unlock
alias rmlogoutlock="sudo rm /tmp/arcologout.lock"

#which graphical card is working
alias whichvga="/usr/local/bin/arcolinux-which-vga"

#free
alias free="free -mt"

#continue download
alias wget="wget -c"

#userlist love it
alias userlist="cut -d: -f1 /etc/passwd"

#merge new settings
alias merge="xrdb -merge ~/.Xresources"

# Aliases for software managment
# pacman or pm
alias pacman='sudo pacman --color auto'
alias update='sudo pacman -Syyu'

# paru as aur helper - updates everything
alias pksyua="paru -Syu --noconfirm"
alias upall="paru -Syu --noconfirm"

#ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"

#grub update
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

#add new fonts
alias update-fc='sudo fc-cache -fv'

# kill commands
# quickly kill conkies
alias kc='killall conky'
# quickly kill polybar
alias kp='killall polybar'

#hardware info --short
alias hw="hwinfo --short"

#skip integrity check
alias paruskip='paru -S --mflags --skipinteg'
alias yayskip='yay -S --mflags --skipinteg'
alias trizenskip='trizen -S --skipinteg'

#check vulnerabilities microcode
alias microcode='grep . /sys/devices/system/cpu/vulnerabilities/*'

#get fastest mirrors in your neighborhood
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 30 --number 10 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 30 --number 10 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 30 --number 10 --sort age --save /etc/pacman.d/mirrorlist"
#our experimental - best option for the moment
alias mirrorx="sudo reflector --age 6 --latest 20  --fastest 20 --threads 5 --sort rate --protocol https --save /etc/pacman.d/mirrorlist"
alias mirrorxx="sudo reflector --age 6 --latest 20  --fastest 20 --threads 20 --sort rate --protocol https --save /etc/pacman.d/mirrorlist"
alias ram='rate-mirrors --allow-root arch | sudo tee /etc/pacman.d/mirrorlist'
alias rams='rate-mirrors --allow-root --protocol https arch  | sudo tee /etc/pacman.d/mirrorlist'

#mounting the folder Public for exchange between host and guest on virtualbox
alias vbm="sudo /usr/local/bin/arcolinux-vbox-share"

#shopt
#shopt -s autocd # change to named directory
#shopt -s cdspell # autocorrects cd misspellings
#shopt -s cmdhist # save multi-line commands in history as single line
#shopt -s dotglob
#shopt -s histappend # do not overwrite history
#shopt -s expand_aliases # expand aliases

#youtube download
alias yta-aac="yt-dlp --extract-audio --audio-format aac "
alias yta-best="yt-dlp --extract-audio --audio-format best "
alias yta-flac="yt-dlp --extract-audio --audio-format flac "
alias yta-mp3="yt-dlp --extract-audio --audio-format mp3 "
alias ytv-best="yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 "

#Recent Installed Packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
alias riplong="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl"

#iso and version used to install ArcoLinux
alias iso="cat /etc/dev-rel | awk -F '=' '/ISO/ {print $2}'"

#Cleanup orphaned packages
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'

#clear
alias clean="clear; seq 1 $(tput cols) | sort -R | sparklines | lolcat"

#search content with ripgrep
alias rg="rg --sort path"

#get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

#nano(vim) for important configuration files
#know what you do in these files
alias nlxdm="sudo $EDITOR /etc/lxdm/lxdm.conf"
alias nlightdm="sudo $EDITOR /etc/lightdm/lightdm.conf"
alias npacman="sudo $EDITOR /etc/pacman.conf"
alias ngrub="sudo $EDITOR /etc/default/grub"
alias nconfgrub="sudo $EDITOR /boot/grub/grub.cfg"
alias nmkinitcpio="sudo $EDITOR /etc/mkinitcpio.conf"
alias nmirrorlist="sudo $EDITOR /etc/pacman.d/mirrorlist"
alias narcomirrorlist='sudo nano /etc/pacman.d/arcolinux-mirrorlist'
alias nsddm="sudo $EDITOR /etc/sddm.conf"
alias nsddmk="sudo $EDITOR /etc/sddm.conf.d/kde_settings.conf"
alias nfstab="sudo $EDITOR /etc/fstab"
alias nnsswitch="sudo $EDITOR /etc/nsswitch.conf"
alias nsamba="sudo $EDITOR /etc/samba/smb.conf"
alias ngnupgconf="sudo nano /etc/pacman.d/gnupg/gpg.conf"
alias nhosts="sudo $EDITOR /etc/hosts"
alias nb="$EDITOR ~/.bashrc" # mostly for server access
alias nz="$EDITOR ~/.zshrc"
alias nh="$EDITOR ~/.config/hypr/hyprland.conf"

#gpg
#verify signature for isos
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
alias fix-gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
#receive the key of a developer
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"
alias fix-gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"
alias fix-keyserver="[ -d ~/.gnupg ] || mkdir ~/.gnupg ; cp /etc/pacman.d/gnupg/gpg.conf ~/.gnupg/ ; echo 'done'"

#fixes
alias fix-permissions="sudo chown -R $USER:$USER ~/.config ~/.local"
alias keyfix="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias key-fix="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias keys-fix="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias fixkey="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias fixkeys="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias fix-key="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias fix-keys="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias fix-sddm-config="/usr/local/bin/arcolinux-fix-sddm-config"
alias fix-pacman-conf="/usr/local/bin/arcolinux-fix-pacman-conf"
alias fix-pacman-keyserver="/usr/local/bin/arcolinux-fix-pacman-gpg-conf"

#maintenance
alias big="expac -H M '%m\t%n' | sort -h | nl"
alias downgrada="sudo downgrade --ala-url https://ant.seedhost.eu/arcolinux/"

#hblock (stop tracking with hblock)
#use unhblock to stop using hblock
alias unhblock="hblock -S none -D none"

#systeminfo
alias probe="sudo -E hw-probe -all -upload"
alias sysfailed="systemctl list-units --failed"

#shutdown or reboot
alias ssn="sudo shutdown now"
alias sr="sudo reboot"

#update betterlockscreen images
alias bls="betterlockscreen -u /usr/share/backgrounds/arcolinux/"

# # ex = EXtractor for all kinds of archives
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   tar xf $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

#btrfs aliases
alias btrfsfs="sudo btrfs filesystem df /"
alias btrfsli="sudo btrfs su li / -t"

#snapper aliases
alias snapcroot="sudo snapper -c root create-config /"
alias snapchome="sudo snapper -c home create-config /home"
alias snapli="sudo snapper list"
alias snapcr="sudo snapper -c root create"
alias snapch="sudo snapper -c home create"


#archlinux applications / when nothing happens change the variable below to "arcolinux"
LVERSION="archlinux"
alias att="$LVERSION-tweak-tool"
alias adt="$LVERSION-desktop-trasher"
alias abl="$LVERSION-betterlockscreen"
alias agm="$LVERSION-get-mirrors"
alias amr="$LVERSION-mirrorlist-rank-info"
alias aom="$LVERSION-osbeck-as-mirror"
alias ars="$LVERSION-reflector-simple"
alias atm="$LVERSION-tellme"
alias avs="$LVERSION-vbox-share"
alias awa="$LVERSION-welcome-app"

#remove
alias rmgitcache="rm -r ~/.cache/git"

#moving your personal files and folders from /personal to ~
alias personal='cp -Rf /personal/* ~'


# own keybind's
alias reload="source ~/.zshrc"
alias mrun='make && make run'
alias rms='shred -zu $@'
alias systemctl='sudo systemctl'
alias sdocker='sudo docker'
alias vector='echo "OHH YEAH!!" | lolcat'
alias nom='npm'
alias ipa='ip -c address'
alias ufw='sudo ufw'
alias nvz="$EDITOR ~/.config/nvim/init.lua"
alias gch="upower -i /org/freedesktop/UPower/devices/battery_BAT0"
alias ssshd="systemctl start sshd"
alias tard="tar -czvf $1"
alias thmovpn="sudo openvpn /home/julian/Downloads/exersalza.ovpn"
alias view="tiv"
alias kermit="cat /home/julian/shennanigans/kermit.txt"
alias vncstart="wayvnc 0.0.0.0 -f 60"
alias nv="$EDITOR ~/.config/nvim/init.*"
alias nv.k="$EDITOR ~/.config/nvim/lua/core/mappings.lua"
alias nv.p="$EDITOR ~/.config/nvim/lua/custom/plugins.lua"
alias nv.c="$EDITOR ~/.config/nvim/lua/custom/chadrc.lua"
alias coffee="/home/julian/shennanigans/coffee.sh"
alias lap="sudo create_ap wlp3s0 enp2s0 FreeVBucks freevbucks"
alias wttrh="wttr hamburg"
alias tmc="$EDITOR ~/.config/tmux/tmux.conf"
alias gitl="git log --graph --oneline --all"
alias lesscat="cat $1 | less"
alias tks="tmux kill-session"
alias fixi3="xrandr --output Virtual1 --mode 1920x1080" # just to fix the res in my vm
alias sml="sh -c 'mouseless &'"
alias pwdc="pwd | clip"
alias whereami="uname -n" # when everything looks the same but isnt
alias c="cargo" # shortcut for cargo
alias cw="cargo watch -x -w src/ -x run"
alias fs="fzf"

# Js / Npm
alias rdev="npm run dev"
alias rbuild="npm run build"
alias rpre="rbuild && npm run preview"

# Python's
alias venva='source venv/bin/activate'
alias venvc='python3 -m venv venv'
alias uvirun='uvicorn main:app --reload'
alias pipr='pip install -r req'
alias py='python'
alias bai='python -m build . && pip install . $^'
alias rlints='flake8 --statistics $(git ls-files "*.py") && pylint $(git ls-files "*.py")'

# arduino dev stuff
alias acl='arduino-cli'

if [[ "$WAYLAND_DISPLAY" -ne "" ]]; then # what copy program to use
  alias clip="wl-copy"
else 
  alias clip="xclip -selection clipboard"
fi

lfcd() {
    tmp="$(mktemp)"
    lf --last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}


[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"

#create a file called .zshrc-personal and put all your personal aliases
#in there. They will not be overwritten by skel.

[[ -f ~/.zshrc-personal ]] && . ~/.zshrc-personal

eval $(thefuck --alias fuck)
eval $(fzf --zsh)

if [ "$colores" = true ] ; then
  seq 1 $(tput cols) | sort -R | sparklines | lolcat
fi

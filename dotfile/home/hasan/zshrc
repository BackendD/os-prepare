# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Created by newuser for 5.6.2
export ZSH=/usr/share/oh-my-zsh
export TERM="xterm-256color"

#ZSH_THEME="drofloh"

plugins=(
    git
    cargo
    gradle
    ng
    npm
    rust
    spring
    tmux
    systemd
    sudo
    nmap
    man
    kubectl
    history
    helm
    archlinux
    docker
    common-aliases
)

source $ZSH/oh-my-zsh.sh

#source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme
#POWERLEVEL9K_MODE="nerdfont-complete"
#ZSH_THEME="/usr/share/zsh-theme-powerlevel9k/powerlevel9k"

source /usr/share/oh-my-zsh/themes/gianu.zsh-theme
ZSH_THEME="/usr/share/oh-my-zsh/themes/gianu.zsh-theme"

#source /home/hasan/.zsh/drofloh_functions.zsh
#ZSH_THEME="/home/hasan/.zsh/themes/drofloh.zsh-theme"

#source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

#if [[ -n $SSH_CONNECTION ]]; then
#	source /usr/share/oh-my-zsh/themes/af-magic.zsh-theme
#	ZSH_THEME="/usr/share/oh-my-zsh/themes/af-magic.zsh-theme"
#else
#	source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme
#	POWERLEVEL9K_MODE="nerdfont-complete"
#	ZSH_THEME="/usr/share/zsh-theme-powerlevel9k/powerlevel9k"
#fi
export GRADLE_HOME="$HOME/.gradle"
export EDITOR=vim

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#####  BASH CONFIG  #####


# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# BASH PROMPT LOOK	
   # Black:30  Blue:34  Cyan:36   Green:32   Purple:35   Red:31   White:37   Yellow:33
PS1='\[\033[1;31m\][\[\033[1;33m\]\u\[\033[1;37m\]@\[\033[1;34m\]\h \[\033[1;37m\]\w\[\033[1;31m\]]\[\033[00m\]\$ '


alias sss='sudo $(history -p !!)'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias yay='cd ~/.dotfiles/nixos && sudo nix flake update'
alias yup='ya pack -u'
alias clean='sudo nix-collect-garbage'
alias cleanall='sudo nix-collect-garbage -d && nix-collect-garbage -d && sudo nixos-rebuild switch --flake ~/.dotfiles/nixos/'
alias reb='reboot'
alias nxs='nix-shell -p'
alias nrs='sudo nixos-rebuild switch --flake ~/.dotfiles/nixos/'
alias nco='vim ~/.dotfiles/nixos/configuration.nix'
alias npk='vim ~/.dotfiles/nixos/modules/pkgs.nix'

alias lspkg='nix-store --query --requisites /run/current-system | grep'
alias lsgen='sudo nix-env -p /nix/var/nix/profiles/system --list-generations'
alias lsdel='.dotfiles/scripts/genlist.sh'
alias delgen='sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations'
alias makecurrent='sudo /run/current-system/bin/switch-to-configuration boot'

alias cfg='git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME'
alias ga='git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME add'
alias gc='git --git-dir $HOME/.cfg.git/ --work-tree=$HOME commit -a -m'
alias ghp='git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME push -u github main'
alias cbp='git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME push codeberg main'
alias ppp='git --git-dir=/home/libor/.cfg.git/ --work-tree=/home/libor push -u github main && git --git-dir=/home/libor/.cfg.git/ --work-tree=/home/libor push codeberg main'

alias gcl='git clone --bare https://codeberg.org/lrestj/nixos.git'
alias gs='git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME status'
alias str='git --git-dir=/home/libor/.cfg.git/ --work-tree=/home/libor log --pretty=format: --name-only --diff-filter=A '
alias untrack='git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME update-index --skip-worktree'

alias config='git --git-dir=/home/libor/.cfg/ --work-tree=/home/libor'

 
#### # END OF FILE  #####

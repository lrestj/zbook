#####  FISH CONFIG  #####


if status is-interactive
    # Commands to run in interactive sessions can go here

fzf --fish | source

abbr mkusb --set-cursor -- "sudo dd if=% of=/dev/sdb bs=4M status=progress conv=fsync"
abbr !! --position anywhere --function last_history_item
abbr sudo "sudo"
abbr ls "ls --color=auto"
abbr grep "grep --color=auto"
abbr yay "nh os switch -H zbook --update"
abbr yup "ya pack -u"
abbr se "nh search --limit 7"
abbr clall "sudo nix-collect-garbage -d && nix-collect-garbage -d && sudo nixos-rebuild switch --flake ~/.dotfiles/nixos#zbook"
abbr reb "reboot"
abbr nxs "nix-shell -p"
abbr nrs "nh os switch -H zbook"
abbr nrb "nh os boot -H zbook"
abbr nrt "nh os test"
abbr nco "$EDITOR ~/.dotfiles/nixos/hosts/zbook/configuration.nix"
abbr npk "$EDITOR ~/.dotfiles/nixos/modules/pkgs.nix"
abbr nfl "$EDITOR ~/.dotfiles/nixos/flake.nix"

abbr lspkg "nix-store --query --requisites /run/current-system | cut -c 45-77 | sort | less"
abbr lsgen "nh os info"
abbr lsdel ".dotfiles/scripts/genlist.sh"
abbr delgen "sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations"
abbr makecurrent "sudo /run/current-system/bin/switch-to-configuration boot"

abbr hpp "NIXPKGS_ALLOW_UNFREE=1 nix-shell -p hplipWithPlugin --run 'sudo -E hp-setup'"

abbr cfg "git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME"
abbr ga "git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME add"
abbr nga "cd $HOME/.dotfiles/install/ && git add"
abbr gc --set-cursor -- "git --git-dir $HOME/.cfg.git/ --work-tree=$HOME commit -a -m \"%\""
abbr ngc --set-cursor -- "cd $HOME/.dotfiles/install/ && git commit -a -m \"%\""
abbr ppp "git --git-dir=/home/libor/.cfg.git/ --work-tree=/home/libor push -u github nixos && git --git-dir=/home/libor/.cfg.git/ --work-tree=/home/libor push gitlab nixos"
abbr npp "cd $HOME/.dotfiles/install/ && git push -u github main && git push gitlab main"
abbr gs "git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME status"
abbr ngs "cd $HOME/.dotfiles/install/ && git status"
abbr str "git --git-dir=/home/libor/.cfg.git/ --work-tree=/home/libor log --pretty=format: --name-only --diff-filter=A "
abbr untrack "git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME update-index --skip-worktree"

end


#####  END OF FILE  #####

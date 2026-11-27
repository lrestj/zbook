if status is-interactive
    # Commands to run in interactive sessions can go here

# Set up fzf key bindings
fzf --fish | source

abbr mkusb --set-cursor -- "sudo dd if=% of=/dev/sdb bs=4M status=progress conv=fsync"
abbr vsv "sudo vsv"
abbr pc "niri msg pick-color"
abbr pw "niri msg pick-window"
abbr !! --position anywhere --function last_history_item
abbr hp "hp-setup -i 192.168.77.5"
abbr sudo "sudo"
abbr ls "ls --color=auto"
abbr grep "grep --color=auto"
abbr yup "ya pack -u"
abbr reb "nfsumount && loginctl reboot"

abbr yay "sudo xbps-install -Su"
abbr in "sudo xbps-install -S"
abbr se "xbps-query -Rs"
abbr rem "sudo xbps-remove -R"
abbr clean "sudo xbps-remove -o"

abbr cfg "git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME"
abbr ga "git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME add"
abbr nga "cd $HOME/.dotfiles/install/ && git add"
abbr gc --set-cursor -- "git --git-dir $HOME/.cfg.git/ --work-tree=$HOME commit -a -m \"%\""
abbr ngc --set-cursor -- "cd $HOME/.dotfiles/install/ && git commit -a -m \"%\""
abbr ppp "git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME push -u github void && git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME push gitlab void"
abbr npp "cd $HOME/.dotfiles/install/ && git push -u github main && git push gitlab main"
abbr gs "git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME status"
abbr ngs "cd $HOME/.dotfiles/install/ && git status"
abbr str "git --git-dir=/home/libor/.cfg.git/ --work-tree=/home/libor log --pretty=format: --name-only --diff-filter=A "
abbr untrack "git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME update-index --skip-worktree"

end

#####  FISH CONFIG  #####


if status is-interactive
    # Commands to run in interactive sessions can go here

fzf --fish | source

abbr in "sudo apt install"
abbr rem "sudo apt remove"
abbr se "apt search"
abbr yay "sudo apt update && sudo apt upgrade"
abbr ls "ls --color=auto"
abbr grep "grep --color=auto"
abbr yup "ya pack -u"
abbr clean "sudo apt autoremove"
abbr reb "reboot"

abbr cfg "git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME"
abbr ga "git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME add"
abbr nga "cd $HOME/.dotfiles/install/ && git add"
abbr gc --set-cursor -- "git --git-dir $HOME/.cfg.git/ --work-tree=$HOME commit -a -m \"%\""
abbr ngc --set-cursor -- "cd $HOME/.dotfiles/install/ && git commit -a -m \"%\""
abbr ppp "git --git-dir=/home/libor/.cfg.git/ --work-tree=/home/libor push -u github cinnamon && git --git-dir=/home/libor/.cfg.git/ --work-tree=/home/libor push gitlab cinnamon"
abbr npp "cd $HOME/.dotfiles/install/ && git push -u github main && git push gitlab main"
abbr gs "git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME status"
abbr ngs "cd $HOME/.dotfiles/install/ && git status"
abbr str "git --git-dir=/home/libor/.cfg.git/ --work-tree=/home/libor log --pretty=format: --name-only --diff-filter=A "
abbr untrack "git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME update-index --skip-worktree"

end


#####  END OF FILE  #####

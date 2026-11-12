#####  FISH CONFIG  #####


if status is-interactive
    # Commands to run in interactive sessions can go here

fzf --fish | source

function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	command yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end


abbr pc "niri msg pick-color"
abbr pw "niri msg pick-window"
abbr !! --position anywhere --function last_history_item
abbr sudo "sudo"
abbr hp "sudo hp-setup -i 192.168.77.5"
abbr ls "ls --color=auto"
abbr grep "grep --color=auto"
abbr yay "sudo apt update && sudo apt upgrade"
abbr clean "sudo apt autoremove"
abbr yup "ya pkg upgrade"
abbr in "sudo apt install"
abbr rem "sudo apt remove"
abbr se "apt search"
abbr reb "systemctl reboot"
abbr sv "systemctl list-unit-files --state=enabled"


abbr cfg "git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME"
abbr ga "git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME add"
abbr nga "cd $HOME/.dotfiles/install/ && git add"
abbr gc --set-cursor -- "git --git-dir $HOME/.cfg.git/ --work-tree=$HOME commit -a -m \"%\""
abbr ngc --set-cursor -- "cd $HOME/.dotfiles/install/ && git commit -a -m \"%\""
abbr ppp "git --git-dir=/home/libor/.cfg.git/ --work-tree=/home/libor push -u github swaydebian && git --git-dir=/home/libor/.cfg.git/ --work-tree=/home/libor push gitlab swaydebian"
abbr npp "cd $HOME/.dotfiles/install/ && git push -u github main && git push gitlab main"
abbr gs "git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME status"
abbr ngs "cd $HOME/.dotfiles/install/ && git status"
abbr str "git --git-dir=/home/libor/.cfg.git/ --work-tree=/home/libor log --pretty=format: --name-only --diff-filter=A "
abbr untrack "git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME update-index --skip-worktree"

end


#####  END OF FILE  #####

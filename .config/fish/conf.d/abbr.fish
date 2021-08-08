abbr v "nvim"
abbr vp "nvim ~/.config/nvim/plugins/"
# abbr pi "pacman -Slq | fzf -m --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S"
# abbr pq "pacman -Ss"
# abbr pr "sudo pacman -Rs"
# abbr yi "yay -Slq | fzf -m --preview 'yay -Si {1}'| xargs -ro yay -S"
# abbr yr "yay -Qeq | fzf -m --preview 'yay -Qi {1}' | xargs -ro yay -Rs"
abbr xi "doas xbps-install -S"
abbr xq "xbps-query -Rs"
abbr xr "doas xbps-remove -R"
abbr xif "xpkg -a | fzf -m --height=100 --layout=default --preview 'xq {1}' | xargs -ro doas xbps-install -S"

# configs
abbr cfa "nvim ~/.config/alacritty/alacritty.yml"
abbr cfb "nvim ~/.config/bspwm/bspwmrc"
abbr cff "nvim ~/.config/fish/config.fish"
abbr cfp "nvim ~/.config/polybar/config"
abbr cfs "nvim ~/.config/sxhkd/sxhkdrc"
abbr cft "nvim ~/.config/tmux.conf"
abbr cfv "nvim ~/.config/nvim/init.vim"
abbr cfx "nvim ~/.xinitrc"

abbr wal "sxiv -t ~/.local/d/pictures/wallpaper"

# git
abbr gs "git status"
abbr ga "git add"
abbr gc "git commit"
abbr gd "git diff"

abbr cx "xsel -i -b"
abbr px "xsel -b"

# youtube-dl
abbr ytdl "youtube-dl -x -o '~/music/download/%(title)s.%(ext)s' --restrict-filenames"
abbr ydl "youtube-dl -o '%(title)s.%(ext)s' --add-metadata --restrict-filenames"

alias ll "exa -l --group-directories-first --icons"
alias la "exa -a --icons"
alias lla "ll -a"
alias config "git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias music 'tmux new-session "tmux source-file ~/.config/ncmpcpp/tmux_session"'
alias irssi 'irssi --config="$XDG_CONFIG_HOME"/irssi/config --home="$XDG_DATA_HOME"/irssi'

#fzf
alias ce "fd -t f -d 3 -E 'undodir' -E 'coc/' . $HOME/.config | fzf | xargs -ro $EDITOR"
alias se "fd -t f . $HOME/bin | fzf | xargs -ro $EDITOR"
alias cwe "fd -t f | fzf | xargs -ro $EDITOR"
alias cw "cd (fd -t d | fzf)"
alias p "cd (fd -t d -d 2 . $HOME/projects | fzf)"
alias c "cd (fd -t d -d 1 . $XDG_CONFIG_HOME | fzf)"
alias d "cd (fd -t d -d 1 . ~/.local/d | fzf)"
alias vid "fd -t f -e mkv -e webm . ~/.local/d/videos | fzf | xargs -r mpv"

alias gpg "gpg2"

#utils
alias cp "cp -iv"
alias rm "rm -Iv"
alias mv "mv -iv"
alias mkd "mkdir -pv"

alias pdcmark "pulldown-cmark -T -S -F -L"

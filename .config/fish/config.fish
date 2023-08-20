umask 0077
set -x FZF_DEFAULT_COMMAND "fd . $dir"
set -x FZF_FIND_FILE_COMMAND "fd --hidden . $HOME"
set -x FZF_OPEN_COMMAND "fd --hidden -t f . $HOME"
set -x FZF_CTRL_T_COMMAND "fd --hidden . $HOME"
set -x FZF_CD_COMMAND "fd -t d . $HOME"
set -x FZF_CD_WITH_HIDDEN_COMMAND "fd --hidden -t d . $HOME"
set -x FZF_PREVIEW_FILE_CMD "bat --style=numbers --color=always"
set -x FZF_PREVIEW_DIR_CMD "exa -l --color=always"
set -x FZF_CD_OPTS "--preview 'exa -l --color=always {}'"
set -x FZF_ENABLE_OPEN_PREVIEW 1
# Rose Pine Dawn
set -Ux FZF_DEFAULT_OPTS "
	--color=fg:#797593,bg:#faf4ed,hl:#d7827e
	--color=fg+:#575279,bg+:#f2e9e1,hl+:#d7827e
	--color=border:#dfdad9,header:#286983,gutter:#faf4ed
	--color=spinner:#ea9d34,info:#56949f,separator:#dfdad9
	--color=pointer:#907aa9,marker:#b4637a,prompt:#797593"

set -x XDG_CONFIG_HOME "$HOME/.config"
set -x XDG_CACHE_HOME "$HOME/.cache"
set -x XDG_DATA_HOME "$HOME/.local/share"
set -x XDG_DATA_DIRS "/usr/local/share:/usr/share"
set -x XDG_CONFIG_DIRS "/etc/xdg"
set -x XDG_RUNTIME_DIR "/tmp/runtime-hoferm"

set -x LESSHISTFILE "-"

set -x INPUTRC "$HOME/.config/inputrc"
set -x GNUPGHOME "$XDG_DATA_HOME/gnupg"
set -x PASSWORD_STORE_DIR "$XDG_DATA_HOME/password-store"

set -x CUDA_CACHE_PATH "$XDG_CACHE_HOME/nv"

set TERM xterm-256color

set -x BROWSER "firefox"
set -x EDITOR "helix"

set fish_greeting

starship init fish | source
zoxide init fish | source
navi widget fish | source

set -x ALSA_CARD "Generic"

fish_vi_key_bindings
function fish_user_key_bindings
    for mode in insert
        bind -M $mode \cs forward-char
    end
end

# Set cursor shape
# beam
set -x fish_cursor_default "line"
set -x fish_cursor_insert "line"
set -x fish_curosr_visual "block"

function fish_mode_prompt
  switch $fish_bind_mode
    case default
      echo -en "\e[2 q"
    case insert
      echo -en "\e[6 q"
    case replace_one
      echo -en "\e[4 q"
    case visual
      echo -en "\e[2 q"
    case '*'
      echo -en "\e[2 q"
  end
  set_color normal
end

if status is-login
   if test -z "$DISPLAY"
       exec startx -- -keeptty
   end
end

# set fish_color_autosuggestion brblack
# set fish_color_cancel -r
# set fish_color_command --bold
# set fish_color_comment brblack
# set fish_color_cwd green
# set fish_color_cwd_root red
# set fish_color_end brmagenta
# set fish_color_error red
# set fish_color_escape 'bryellow' '--background=brblue'
# set fish_color_history_current --bold
# set fish_color_host normal
# set fish_color_host_remote yellow
# set fish_color_match --background=brblue
# set fish_color_normal normal
# set fish_color_operator bryellow
# set fish_color_param cyan
# set fish_color_quote green
# set fish_color_redirection brblue
# set fish_color_search_match 'bryellow' '--background=brblack'
# set fish_color_selection 'white' '--bold' '--background=brblack'
# set fish_color_status red
# set fish_color_user brgreen
# set fish_color_valid_path --underline

# Alternate paper color theme
# set -l color00 '#eeeeee'
# set -l color01 '#af0000'
# set -l color02 '#008700'
# set -l color03 '#5f8700'
# set -l color04 '#0087af'
# set -l color05 '#444444'
# set -l color06 '#005f87'
# set -l color07 '#878787'
# set -l color08 '#bcbcbc'
# set -l color09 '#d70000'
# set -l color0A '#d70087'
# set -l color0B '#8700af'
# set -l color0C '#d75f00'
# set -l color0D '#d75f00'
# set -l color0E '#005faf'
# set -l color0F '#005f87'

# set -l FZF_NON_COLOR_OPTS

# for arg in (echo $FZF_DEFAULT_OPTS | tr " " "\n")
#     if not string match -q -- "--color*" $arg
#         set -a FZF_NON_COLOR_OPTS $arg
#     end
# end

# set -U FZF_DEFAULT_OPTS "$FZF_NON_COLOR_OPTS"\
# " --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D"\
# " --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C"\
# " --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D"

# Paper color
# set -x FZF_DEFAULT_OPTS "$FZF_DEFAULT_OPTS"\
#     "--color=fg:#4d4d4c,bg:#eeeeee,hl:#d7005f"\
#     "--color=fg+:#4d4d4c,bg+:#e8e8e8,hl+:#d7005f"\
#     "--color=info:#4271ae,prompt:#8959a8,pointer:#d7005f"\
#     "--color=marker:#4271ae,spinner:#4271ae,header:#4271ae"

# Nord
set -x FZF_DEFAULT_OPTS "$FZF_DEFAULT_OPTS"\
    "--color fg:#D8DEE9,bg:#2E3440,hl:#A3BE8C,fg+:#D8DEE9,bg+:#434C5E,hl+:#A3BE8C"\
    "--color pointer:#BF616A,info:#4C566A,spinner:#4C566A,header:#4C566A,prompt:#81A1C1,marker:#EBCB8B"

set -x LS_COLORS 'no=00:rs=0:fi=00:di=01;34:ln=36:mh=04;36:pi=04;01;36:so=04;33:do=04;01;36:bd=01;33:cd=33:or=31:mi=01;37;41:ex=01;36:su=01;04;37:sg=01;04;37:ca=01;37:tw=01;37;44:ow=01;04;34:st=04;37;44:*.7z=01;32:*.ace=01;32:*.alz=01;32:*.arc=01;32:*.arj=01;32:*.bz=01;32:*.bz2=01;32:*.cab=01;32:*.cpio=01;32:*.deb=01;32:*.dz=01;32:*.ear=01;32:*.gz=01;32:*.jar=01;32:*.lha=01;32:*.lrz=01;32:*.lz=01;32:*.lz4=01;32:*.lzh=01;32:*.lzma=01;32:*.lzo=01;32:*.rar=01;32:*.rpm=01;32:*.rz=01;32:*.sar=01;32:*.t7z=01;32:*.tar=01;32:*.taz=01;32:*.tbz=01;32:*.tbz2=01;32:*.tgz=01;32:*.tlz=01;32:*.txz=01;32:*.tz=01;32:*.tzo=01;32:*.tzst=01;32:*.war=01;32:*.xz=01;32:*.z=01;32:*.Z=01;32:*.zip=01;32:*.zoo=01;32:*.zst=01;32:*.aac=32:*.au=32:*.flac=32:*.m4a=32:*.mid=32:*.midi=32:*.mka=32:*.mp3=32:*.mpa=32:*.mpeg=32:*.mpg=32:*.ogg=32:*.opus=32:*.ra=32:*.wav=32:*.3des=01;35:*.aes=01;35:*.gpg=01;35:*.pgp=01;35:*.doc=32:*.docx=32:*.dot=32:*.odg=32:*.odp=32:*.ods=32:*.odt=32:*.otg=32:*.otp=32:*.ots=32:*.ott=32:*.pdf=32:*.ppt=32:*.pptx=32:*.xls=32:*.xlsx=32:*.app=01;36:*.bat=01;36:*.btm=01;36:*.cmd=01;36:*.com=01;36:*.exe=01;36:*.reg=01;36:*~=02;37:*.bak=02;37:*.BAK=02;37:*.log=02;37:*.log=02;37:*.old=02;37:*.OLD=02;37:*.orig=02;37:*.ORIG=02;37:*.swo=02;37:*.swp=02;37:*.bmp=32:*.cgm=32:*.dl=32:*.dvi=32:*.emf=32:*.eps=32:*.gif=32:*.jpeg=32:*.jpg=32:*.JPG=32:*.mng=32:*.pbm=32:*.pcx=32:*.pgm=32:*.png=32:*.PNG=32:*.ppm=32:*.pps=32:*.ppsx=32:*.ps=32:*.svg=32:*.svgz=32:*.tga=32:*.tif=32:*.tiff=32:*.xbm=32:*.xcf=32:*.xpm=32:*.xwd=32:*.xwd=32:*.yuv=32:*.anx=32:*.asf=32:*.avi=32:*.axv=32:*.flc=32:*.fli=32:*.flv=32:*.gl=32:*.m2v=32:*.m4v=32:*.mkv=32:*.mov=32:*.MOV=32:*.mp4=32:*.mpeg=32:*.mpg=32:*.nuv=32:*.ogm=32:*.ogv=32:*.ogx=32:*.qt=32:*.rm=32:*.rmvb=32:*.swf=32:*.vob=32:*.webm=32:*.wmv=32:'

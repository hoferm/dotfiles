function beam --on-event fish_prompt --on-variable fish_bind_mode
    if test $fish_bind_mode = 'default'
        echo -ne "\e[2 q"
    else
        echo -ne "\e[6 q"
    end
end

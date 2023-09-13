if status is-interactive

pfetch
starship init fish | source

set fish_greeting

alias ls="eza --icons  -a --group-directories-first"

end

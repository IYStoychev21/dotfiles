if status is-interactive

pfetch
starship init fish | source

set fish_greeting

alias ls="eza --icons  -a --group-directories-first"
alias zen="flatpak run io.github.zen_browser.zen"

end

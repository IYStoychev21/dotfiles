if status is-interactive

pfetch
starship init fish | source

set fish_greeting

alias ls="eza --icons  -a --group-directories-first"

set BUN_INSTALL "$HOME/.bun"
set PATH $BUN_INSTALL/bin:$PATH
set PATH /opt/android-sdk/platform-tools:$PATH

end

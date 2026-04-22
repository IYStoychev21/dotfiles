#!/bin/bash
# Outputs waybar JSON for MangoWM keyboard layout via mmsg

render() {
    local lang
    lang=$(mmsg -g -k 2>/dev/null | tr -d '[:space:]')
    case "$lang" in
        *English*|*en*) lang="EN" ;;
        *Bulgarian*|*bg*) lang="BG" ;;
    esac
    printf '{"text":"    %s"}\n' "$lang"
}

render
mmsg -w -k 2>/dev/null | while read -r line; do
    lang=$(echo "$line" | tr -d '[:space:]')
    case "$lang" in
        *English*|*en*) lang="EN" ;;
        *Bulgarian*|*bg*) lang="BG" ;;
    esac
    printf '{"text":"    %s"}\n' "$lang"
done

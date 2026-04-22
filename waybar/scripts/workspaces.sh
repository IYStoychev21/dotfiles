#!/bin/bash
# Outputs waybar JSON for MangoWM tags via mmsg

render() {
    local text=""
    while IFS=' ' read -r _monitor tag state _clients _focused; do
        case "$state" in
            1) text+="" ;;   # active
            2) text+="" ;;   # urgent
            *) text+="" ;;   # inactive
        esac
    done < <(mmsg -g -t 2>/dev/null)
    printf '{"text":"%s"}\n' "$text"
}

render
mmsg -w -t 2>/dev/null | while read -r _; do
    render
done

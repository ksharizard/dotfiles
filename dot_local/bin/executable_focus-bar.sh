#!/usr/bin/env bash

get_bar_id() {
    niri msg --json windows | jq -r '.[] | select(.title | startswith("bar:")) | .id'
}

BAR_ID=$(get_bar_id)
IS_BAR_FOCUSED=$(niri msg --json windows | jq '.[] | select(.is_focused) | .title | startswith("bar:")')

if [[ -z "$BAR_ID" ]]; then
    niri msg action spawn -- "kitty" "-e" "tmux" "attach"
    sleep 1
    BAR_ID=$(get_bar_id)
    niri msg action move-window-to-workspace --window-id "$BAR_ID" 5
fi

niri msg action focus-window --id "$BAR_ID"

if [[ "$IS_BAR_FOCUSED" == "true" ]]; then
    niri msg action focus-window-previous
fi

function fish_right_prompt
    echo "$CMD_DURATION 1000" | awk '{printf "%.3fs", $1 / $2}'
end

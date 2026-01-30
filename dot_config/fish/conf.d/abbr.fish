# -----------------------------------------------------------------------------
# Sane defaults
# -----------------------------------------------------------------------------

abbr -a cp 'cp -iv'
abbr -a ffmpeg 'ffmpeg -hide_banner'
abbr -a mkdir 'mkdir -pv'
abbr -a mv 'mv -iv'
abbr -a rsync 'rsync -vrPlu'

# -----------------------------------------------------------------------------
# Color
# -----------------------------------------------------------------------------

abbr -a cat 'bat -p'
abbr -a diff 'diff --color=auto'
abbr -a ip 'ip --color=auto'
abbr -a ls 'ls --almost-all --color=auto --group-directories-first --human-readable --indicator-style=slash'
abbr -a --position anywhere -- --help '--help | bat -plhelp'
abbr -a --position anywhere -- -h '-h | bat -plhelp'

# -----------------------------------------------------------------------------
# Miscellaneous
# -----------------------------------------------------------------------------

function last_history_item
    echo $history[1]
end
abbr -a !! --position anywhere --function last_history_item
abbr -a mirrors 'sudo reflector -c $(curl --silent ifconfig.co/country-iso) --sort rate -a 24 -f 5 -p https --save /etc/pacman.d/mirrorlist'
abbr -a wget 'wget --hsts-file=$XDG_CACHE_HOME/wget-hsts'

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
abbr -a ls 'exa -a --color=always --group-directories-first'
abbr -a --position anywhere -- --help '--help | bat -plhelp'
abbr -a --position anywhere -- -h '-h | bat -plhelp'

# -----------------------------------------------------------------------------
# Git
# -----------------------------------------------------------------------------

abbr -a glog "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'"

# -----------------------------------------------------------------------------
# Miscellaneous
# -----------------------------------------------------------------------------

abbr -a mirrors 'sudo reflector -c $(curl --silent ifconfig.co/country-iso) --sort rate -a 24 -f 5 -p https --save /etc/pacman.d/mirrorlist'
abbr -a trash 'gio trash'
abbr -a wget 'wget --hsts-file=$XDG_CACHE_HOME/wget-hsts'

# Adding PATH
fish_add_path -p (find ~/.local/bin -type d)

# XDG Base Directory Specification
set -qU XDG_CONFIG_HOME; or set -Ux XDG_CONFIG_HOME $HOME/.config
set -qU XDG_DATA_HOME; or set -Ux XDG_DATA_HOME $HOME/.local/share
set -qU XDG_CACHE_HOME; or set -Ux XDG_CACHE_HOME $HOME/.cache
set -qU XDG_STATE_HOME; or set -Ux XDG_STATE_HOME $HOME/.local/state
set -qU XDG_RUNTIME_DIR; or set -Ux XDG_RUNTIME_DIR /run/user/$(id -u)

# Default programs
set -gx EDITOR nvim
set -gx TERMINAL kitty
set -gx BROWSER zen-browser

set -gx WINEPREFIX "$XDG_DATA_HOME/wineprefixes/default"
set -gx CARGO_HOME "$XDG_DATA_HOME/cargo"
set -gx RUSTUP_HOME $XDG_DATA_HOME/rustup
set -gx PYTHON_HISTORY "$XDG_DATA_HOME/python_history"
set -gx PYTHONPYCACHEPREFIX "$XDG_CACHE_HOME/python"
set -gx PYTHONUSERBASE "$XDG_DATA_HOME/python"
set -gx GOPATH "$XDG_DATA_HOME/go"
set -gx GOMODCACHE "$XDG_CACHE_HOME/go/mod"
set -gx GNUPGHOME $XDG_DATA_HOME/gnupg
set -gx NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/npmrc
set -gx _JAVA_OPTIONS "-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java"
set -gx WGETRC "$XDG_CONFIG_HOME/wgetrc"
set -gx NODE_REPL_HISTORY "$XDG_DATA_HOME"/node_repl_history

# Program settings
set -gx FZF_DEFAULT_OPTS "--layout=reverse --height 40% --preview 'bat --color=always {}'"
set -gx MANPAGER "sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'"
set -gx QT_QPA_PLATFORMTHEME gtk3
set -gx GTK_THEME Dracula

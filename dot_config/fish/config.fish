# Set theme
fish_config theme choose "Rosé Pine"

# Disable fish greeting message
set -g fish_greeting

# Enable Vi keybindings
fish_vi_key_bindings

# Enable fzf keybindings
fzf --fish | source

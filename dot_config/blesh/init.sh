bleopt history_share=1
bleopt exec_errexit_mark=

set -o vi

function blerc/vim-mode-hook {
    ble-bind -m vi_nmap --cursor 2
    ble-bind -m vi_imap --cursor 5
    ble-bind -m vi_omap --cursor 4
    ble-bind -m vi_xmap --cursor 2
    ble-bind -m vi_cmap --cursor 0

    ble-bind -m vi_imap -f 'C-c' discard-line
    ble-bind -m vi_nmap -f 'C-c' discard-line

    ble-import vim-surround
}

ble-import contrib/prompt-vim-mode
PS1='[\u@\h \W]\q{contrib/vim-mode}\$ '
bleopt keymap_vi_mode_show:=

# Do not show mode line
blehook/eval-after-load keymap_vi blerc/vim-mode-hook

# Performance

## Completion
bleopt complete_limit_auto=2000
bleopt complete_limit_auto_menu=100
bleopt complete_timeout_auto=5000
bleopt complete_timeout_compvar=200
bleopt complete_polling_cycle=50

## Menu
# Limit the menu height
bleopt complete_menu_maxlines=10

# Use a simple layout for the menu
bleopt complete_menu_style=dense

## Filename
bleopt highlight_timeout_async=5000
bleopt highlight_timeout_sync=50
bleopt highlight_eval_word_limit=200

bleopt complete_menu_color=off
bleopt complete_menu_color_match=on

## Intro

bleopt editor=nvim

##-----------------------------------------------------------------------------
## Line editor settings

## The following setting turns on the delete selection mode when an non-empty
## value is set. When the mode is turned on the selection is removed when a
## user inserts a character.

#bleopt delete_selection_mode=1

## The following settings control the indentation. "indent_offset" sets the
## indent width. "indent_tabs" controls if tabs can be used for indentation or
## not. If "indent_tabs" is set to 0, tabs will never be used. Otherwise
## indentation is made with tabs and spaces.

bleopt indent_offset=4
#bleopt indent_tabs=1

## "undo_point" controls the cursor position after "undo". When "beg" or "end"
## is specified, the cursor will be moved to the beginning or the end of the
## dirty section, respectively. When other values are specified, the original
## cursor position is reproduced.

#bleopt undo_point=end

## The following setting controls forced layout calculations before graphical
## operations. When a non-empty value is specified, the forced calculations are
## enabled. When an empty string is set, the operations are switched to logical
## ones.

#bleopt edit_forced_textmap=1

## The following option controls the interpretation of lines when going to the
## beginning or the end of the current line.  When the value `logical` is
## specified, the logical line is used, i.e., the beginning and the end of the
## line is determined based on the newline characters in the edited text.  When
## the value `graphical` is specified, the graphical line is used, i.e., the
## beginning and the end of the displayed line in the terminal is used.

bleopt edit_line_type=graphical

#bleopt edit_magic_expand=history:sabbrev:alias  # Expandir aliases como abreviaciones

## The following option controls the position of the info pane where completion
## menu, mode names, and other information are shown.  When the value "top" is
## specified, the info pane is shown just below the command line.  When the
## value "bottom" is specified, the info pane is shown at the bottom of the
## terminal.  The default is "top".

#bleopt info_display=bottom
bleopt info_display=top

## "prompt_eol_mark" specifies the contents of the mark used to indicate the
## command output is not ended with newlines. The value can contain ANSI escape
## sequences.

bleopt prompt_eol_mark=$'\e[1;31m⏎ \e[m'

## "exec_errexit_mark" specifies the format of the mark to show the exit status
## of the command when it is non-zero.  If this setting is an empty string the
## exit status will not be shown.  The value can contain ANSI escape sequences.

#bleopt exec_errexit_mark=$'\e[91m[ble: exit %d]\e[m'

#Esto deshabilita el mensaje de estado de salida:
bleopt exec_errexit_mark=''

# Mensaje de tiempo transcurrido de ejecución de comando
bleopt exec_elapsed_mark=$'\e[94m[%ss (%s %%)]\e[m'
# Tiempo para mensaje de transcurso de tiempo
bleopt exec_elapsed_enabled='sys+usr>=2*60*1000'

## The following setting controls the exit when jobs are remaining. When an
## empty string is set, the shell will never exit with remaining jobs through
## widgets. When an non-empty value is set, the shell will exit when exit is
## attempted twice consecutively.

#bleopt allow_exit_with_jobs=

## The following setting controls the cursor position after the move to other
## history entries. When non-empty values are specified, the offset of the
## cursor from the beginning of the command line is preserved. When an empty
## value is specified the cursor position is the beginning or the end of the
## command lines when the move is to a newer or older entry, respectively.

#bleopt history_preserve_point=

## The following setting controls the history sharing. If it has non-empty
## value, the history sharing is enabled. With the history sharing, the command
## history is shared with the other Bash ble.sh sessions with the history
## sharing turned on.

bleopt history_share=1

## The following setting controls the behavior of the widget
## "accept-single-line-or-newline" in the single-line editing mode. The value
## is a subject of arithmetic evaluation. When it evaluates to negative
## integers, the line is always accepted. When it evaluates to 0, it enters the
## multiline editing mode when there is any unprocessed user inputs, or
## otherwise the line is accepted. When it evaluates to a positive integer "n",
## it enters the multiline editing mode when there is more than "n"unprocessed
## user inputs.

#bleopt accept_line_threshold=5

## The following option controls the behavior when the number of characters
## exceeds the capacity specified by `line_limit_length`.  The value `none`
## means that the number of characters will not be checked.  The value
## `discard` means that the characters cannot be inserted when the number of
## characters exceeds the capacity.  The value `truncate` means that the
## command line is truncated from its end to fit into the capacity.  The value
## `editor` means that the widget `edit-and-execute` will be invoked to open an
## editor to edit the command line contents.

#bleopt line_limit_type=truncate

## The following option specifies the capacity of the command line in the
## number of characters.  The number 0 or negative numbers means the unlimited
## capacity.

#bleopt line_limit_length=${COLUMNS}

## The following option specifies the maximal number of characters which can be
## appended into the history.  When this option has a positive value, commands
## with the length longer than the value is not appended to the history.  When
## this option has a non-positive value, commands are always appended to the
## history regardless of their length.

#bleopt history_limit_length=10000

##-----------------------------------------------------------------------------
## Terminal state control

## The following setting specifies the cursor type when commands are executed.
## The cursor type is specified by the argument of the control function
## DECSCUSR.

bleopt term_cursor_external=0

## The following settings, external and internal, specify the "modifyOtherKeys"
## states [the control function SM(>4)] when commands are executed and when
## ble.sh has control, respectively.

#bleopt term_modifyOtherKeys_external=auto
#bleopt term_modifyOtherKeys_internal=auto

##-----------------------------------------------------------------------------
## Rendering options

## "tab_width" specifies the width of TAB on the command line. When an empty
## value is specified, the width in terminfo (tput it) is used.

bleopt tab_width=4

## "char_width_mode" specifies the width of East_Asian_Width=A characters.
## When the value "east" is specified, the width is 2. When the value "west"
## is specified, the width is 1. When "auto" is specified, "east" or "west"
## is automatically selected based on interactions with the terminal. When
## the value "emacs" is specified, the width table (depending on characters)
## used in Emacs is used.

bleopt char_width_mode=auto

## "emoji_width" specifies the width of emoji characters.  If an empty value is
## specified, special treatment of emoji is disabled.

bleopt emoji_width=2

## "emoji_version" specifies the version of Unicode Emoji.  Available values
## are 1.0, 2.0, 3.0, 4.0, 5.0, 11.0, 12.0, 12.1, 13.0, and 13.1.

bleopt emoji_version=13.0

##-----------------------------------------------------------------------------
## User input settings

## The following setting sets the default keymap. The value "emacs" specifies
## that the emacs keymap should be used. The value "vi" specifies that the vi
## keymap (insert mode) should be used as the default. The value "auto"
## specifies that the keymap should be automatically selected from "emacs" or
## "vi" according to the current readline state "set -o emacs" or "set -o vi".

bleopt default_keymap=vi
##-----------------------------------------------------------------------------
## Settings for completion

## The following settings turn on/off the corresponding functionalities. When
## non-empty strings are set, the functionality is enabled. Otherwise, the
## functionality is inactive.

bleopt complete_auto_complete=1
bleopt complete_menu_complete=1
bleopt complete_menu_filter=1

## Esta configuración permite autocompletado insensible a mayúsculas

bind 'set completion-ignore-case on'

## If "complete_ambiguous" has non-empty values, ambiguous completion
## candidates are generated for completion.

#bleopt complete_ambiguous=1

## If "complete_contract_function_names" has non-empty values, the function
## name candidates are grouped by prefixes of the directory-like form "*/".

#bleopt complete_contract_function_names=1

## By default, ble.sh does not allow rewriting the existing text if non-unique
## candidates does not contain the existing text.  If this setting has
## non-empty values, ble.sh rewrites the existing text.

#bleopt complete_allow_reduction=1

## If "complete_auto_history" has non-empty values, auto-complete searches
## matching command lines from history.

bleopt complete_auto_history=0

## The following setting controls the delay of auto-complete after the last
## user input. The unit is millisecond.

bleopt complete_auto_delay=0

## The setting "complete_auto_wordbreaks" is used as the delimiters for
## identifying words for M-right (auto-complete/insert-word).  The default
## value is $' \t\n'.  If the empty value is set, the default value is used.

#bleopt complete_auto_wordbreaks=$' \t\n/'

## The setting "complete_auto_menu" controls the delay of "auto-menu".  When a
## non-empty string is set, auto-menu is enabled.  The string is evaluated as
## an arithmetic expression to give the delay in milliseconds.  ble.sh will
## automatically show the menu of completions after the idle time (for which
## user input does not arrive) reaches the delay.

#bleopt complete_auto_menu=1
#bleopt complete_auto_menu=5000

## When there are user inputs while generating completion candidates, the
## candidates generation will be canceled to process the user inputs. The
## following setting controls the interval of checking user inputs while
## generating completion candidates.

#bleopt complete_polling_cycle=1
#bleopt complete_polling_cycle=50

## A hint on the maximum acceptable size of any data structure generated during
## the completion process, beyond which the completion may be prematurely
## aborted to avoid excessive processing time.  "complete_limit" is used for
## TAB completion.  When its value is empty, the size checks are disabled.
## "complete_limit_auto" is used for auto-completion.  When its value is empty,
## the setting "complete_limit" is used instead.

bleopt complete_limit=300
bleopt complete_limit_auto=200

## The following setting controls the timeout for the pathname expansions
## performed in auto-complete.  When the word contains a glob pattern that
## takes a long time to evaluate the pathname expansion, auto-complete based on
## the filename is canceled based on the timeout setting.  The value specifies
## the timeout duration in milliseconds.  When the value is empty, the
## timeout is disabled.

# IMPORTANTE: Establecerlo, para que en directorios grandes, no se trabe
bleopt complete_timeout_auto=3000

## The following setting controls the timeout for the pathname expansions to
## prepare COMP_WORDS and COMP_LINE for progcomp.  When the word contains a
## glob pattern that takes a long time to evaluate, the pathname expansion is
## canceled, and a noglob expansion is used to construct COMP_WORDS and
## COMP_LINE.  The value specifies ## the timeout duration in milliseconds.
## When the value is empty, the timeout is disabled.

bleopt complete_timeout_compvar=200

## The following setting specifies the style of the menu to show completion
## candidates. The value "dense" and "dense-nowrap" shows candidates separated
## by spaces. "dense-nowrap" is different from "dense" in the behavior that it
## inserts a new line before the candidates that does not fit into the
## remaining part of the current line. The value "align" and "align-nowrap"
## aligns the candidates. The value "linewise" shows a candidate per line.  The
## value "desc" and "desc-raw" shows a candidate per line with description for
## each. "desc-raw" is different from "desc" in the behavior that it interprets
## ANSI escape sequences in the descriptions.

bleopt complete_menu_style="align"

## The following setting specifies the maximal align width for
## complete_menu_style="align" and "align-nowrap".

## When a non-empty value is specified to this setting, the highlighting of the
## menu items is enabled.  This setting is synchronized with the readline
## variable "colored-stats".

#bleopt complete_menu_color=on

## When a non-empty value is specified to this setting, the part of the menu
## items matching with the already input text is highlighted.  This setting is
## synchronized with the readline variable "colored-completion-prefix".

#bleopt complete_menu_color_match=on

bleopt menu_align_min=4
bleopt menu_align_max=22

##########################################################
########### Colores de resaltado de sintaxis #############
##########################################################

# Puedes ver los colores con el comando "ble-color-setface"

ble-face -s region fg=white,bg=60
ble-face -s region_insert fg=#6B6E6
# ble-face -s region_match              fg=white,bg=55
# ble-face -s region_target             fg=black,bg=153
# ble-face -s disabled                  fg=242
# ble-face -s overwrite_mode            fg=black,bg=51
case $TERM in
screen | *tmux*) ble-face -s auto_complete fg=#6B6E6E,underline ;;
*) ble-face -s auto_complete fg=#6B6E6E ;;
esac

# Estos 2 ↓ no se encuentran cuando se activa vim-airline, reportar como bug
#ble-face -s menu_filter_fixed         bold,underline
#ble-face -s menu_filter_input         fg=229,bg=16

ble-face -s vbell fg=green,bold,italic
ble-face -s vbell_erase fg=#000
ble-face -s vbell_flash fg=red,reverse,bold,italic
#ble-face -s prompt_status_line        fg=231,bg=240

# ble-face -s syntax_default            none
# ble-face -s syntax_command            fg=brown
ble-face -s syntax_quoted fg=green,italic
# ble-face -s syntax_quotation          fg=green,bold
ble-face -s syntax_expr fg=9
#ble-face -s syntax_error              fg=#ff9500,bold,underline
ble-face -s syntax_error fg=red,bold,underline
ble-face -s argument_error fg=yellow,bold
ble-face -s syntax_varname fg=#ff9500,bold
ble-face -s syntax_delimiter fg=220
# ble-face -s syntax_param_expansion    fg=purple
ble-face -s syntax_history_expansion fg=#A017A2
ble-face -s syntax_function_name fg=#9F6DE4,bold
ble-face -s syntax_comment fg=#7f7f7f,italic
# ble-face -s syntax_glob               fg=198,bold
# ble-face -s syntax_brace              fg=37,bold
# ble-face -s syntax_tilde              fg=navy,bold
ble-face -s syntax_document fg=#54ff54,italic
ble-face -s syntax_document_begin fg=#ff004c,bold
# ble-face -s command_builtin_dot       fg=red,bold
ble-face -s command_builtin fg=red
ble-face -s command_alias fg=51
ble-face -s command_function fg=purple # fg=purple
ble-face -s command_file fg=#54ff54
ble-face -s command_keyword fg=#F81E16,bold
# ble-face -s command_jobs              fg=red,bold
ble-face -s command_directory fg=#438eff,underline
ble-face -s filename_directory fg=#438eff,underline
# ble-face -s filename_directory_sticky underline,fg=white,bg=26
ble-face -s filename_link underline,fg=#00e5ff
ble-face -s filename_orphan fg=teal,bg=240,underline
# ble-face -s filename_setuid           underline,fg=black,bg=220
# ble-face -s filename_setgid           underline,fg=black,bg=191
# ble-face -s filename_executable       underline,fg=green
# ble-face -s filename_other            underline
ble-face -s filename_socket underline,fg=13
ble-face -s filename_pipe underline,fg=orange
ble-face -s filename_character underline,fg=11
ble-face -s filename_block underline,fg=11
# ble-face -s filename_warning          underline,fg=red
ble-face -s filename_url underline,italic,fg=#FF613D
# ble-face -s filename_ls_colors        underline
# ble-face -s varname_array             fg=orange,bold
# ble-face -s varname_empty             fg=31
# ble-face -s varname_export            fg=200,bold
# ble-face -s varname_expr              fg=92,bold
# ble-face -s varname_hash              fg=70,bold
ble-face -s varname_number fg=11
# ble-face -s varname_readonly          fg=200
# ble-face -s varname_transform         fg=29,bold
ble-face -s varname_unset fg=#ff004c

# Do not show mode line
bleopt keymap_vi_mode_show:=

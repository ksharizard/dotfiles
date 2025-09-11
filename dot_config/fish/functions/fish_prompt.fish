function fish_prompt
    set -l last_status $status

    # Define local Git prompt settings
    set -l __fish_git_prompt_show_informative_status 1
    set -l __fish_git_prompt_color_branch brmagenta
    set -l __fish_git_prompt_showupstream informative
    set -l __fish_git_prompt_showdirtystate yes
    set -l __fish_git_prompt_color_stagedstate yellow
    set -l __fish_git_prompt_color_invalidstate red
    set -l __fish_git_prompt_color_cleanstate brgreen

    # Set up the prompt string
    printf '%s%s %s%s%s%s' \
        (set_color $fish_color_host) (prompt_hostname) \
        (set_color $fish_color_cwd) (prompt_pwd) \
        (set_color normal) (fish_git_prompt)

    # Add the status symbol
    if not test $last_status -eq 0
        set_color $fish_color_error
    end
    echo -n '$ '
    set_color normal
end

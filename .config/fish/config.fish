if status is-interactive

    # env

    set -gx fish_greeting
    set -U fish_prompt_pwd_dir_length 0

    set -gx TERM "xterm-256color"

    set -gx EDITOR micro
    set -gx VISUAL micro
    set -gx PAGER most

    set -gx fish_color_command "green"

    # aliases
    alias ls="exa --icons"
    alias la="exa --icons -l"
    alias df="duf"

    # fish left prompt
    function fish_prompt

        # directory
        set _fish_prompt_path (string replace $HOME "~" $PWD)
        # prompt glyph
        printf "$(set_color blue)$_fish_prompt_path $(set_color normal) \n▲ "
    end

    # fish right prompt

    function fish_right_prompt

        # branch_name_check
        function _right_prompt_git_branch
            command git branch --show-current 2>/dev/null
        end

        # staged_check
        function _righ_prompt_staged
            command git status --porcelain 2>/dev/null | grep -e "^[MADRCU]"
        end

        # unstaged_check
        function _right_prompt_unstaged
            command git status --porcelain 2>/dev/null | grep -e "^[MADRCU? ][MADRCU?]"
        end

        # default = green
        set _righ_prompt_color "green"
        # staged = red
        if test -n "$(_righ_prompt_staged)"
            set _righ_prompt_color "red"
        end
        # unstaged = yellow
        if test -n "$(_right_prompt_unstaged)"
            set _righ_prompt_color "bryellow"
        end

        # output
        printf "$(set_color $_right_prompt_color) %s" (_right_prompt_git_branch)
    end
end

function fish_right_prompt
    if not type -fq git  # exit if git is not available
        return 1
    end

    set --local prompt_git (_pure_prompt_git)
    echo $prompt_git
end

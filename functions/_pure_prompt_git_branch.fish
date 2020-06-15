function _pure_prompt_git_branch
    set --local git_branch (_pure_parse_git_branch) # current git branch
    set --local git_branch_color (_pure_set_color $pure_color_git_clean)

    set --local is_git_dirty (
        # The first checks for staged changes, the second for unstaged ones.
        # We put them in this order because checking staged changes is *fast*.
        not command git diff-index --ignore-submodules --cached --quiet HEAD -- >/dev/null 2>&1
        or not command git diff --ignore-submodules --no-ext-diff --quiet --exit-code >/dev/null 2>&1
        and echo "true"
    )
    if test -n "$is_git_dirty"  # untracked or un-commited files
        set git_branch_color (_pure_set_color $pure_color_git_dirty)
    end

    echo "$git_branch_color$git_branch"
end

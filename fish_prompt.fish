# name: rollhax

# forked from RobbyRussel

function fish_prompt
  set -l last_status $status
  set -l cyan (set_color -o cyan)
  set -l yellow (set_color -o yellow)
  set -l red (set_color -o red)
  set -l blue (set_color -o blue)
  set -l green (set_color -o green)
  set -l normal (set_color normal)

  if test $last_status = 0
      set arrow "$green➜ "
  else
      set arrow "$red➜ "
  end
  set -l cwd $cyan (prompt_pwd)

  if git.is_branch
    set -l branch_name (git.branch)
    set -l branch_color $green
    if ! git.is_dirty
      set branch_color $red
    end

    set -l git_branch $branch_color$branch_name
    set git_info "$blue git:($git_branch$blue)"
  end

  echo -n -s $arrow ' ' $cwd $git_info $normal ' '
end


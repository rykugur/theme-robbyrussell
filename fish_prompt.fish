# name: rollhax
# forked from RobbyRussel

function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty --untracked-files=normal 2> /dev/null)
end

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

  if [ (git.branch) ]
    set -l branch_name (git.branch)
    if [ (_is_git_dirty) ]
        set branch_color $red
    else
      set branch_color $green
    end

    set -l git_branch $branch_color$branch_name
    set git_info "$blue git:($git_branch$blue)"
  end

  echo -n -s $arrow ' ' $cwd $git_info $normal ' '
end


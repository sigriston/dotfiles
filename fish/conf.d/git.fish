# Git Aliases
alias cdg="cd (git root)"

# Git Abbreviations
if status --is-interactive
  abbr -a -g ga "git add"
  abbr -a -g gaa "git add -A"

  abbr -a -g gb "git branch"
  abbr -a -g gba "git branch -a"
  abbr -a -g gbm "git branch -m"

  abbr -a -g gc "git commit"
  abbr -a -g gca "git commit --amend"
  abbr -a -g gcm "git commit -m"

  abbr -a -g gcb "git checkout -b"
  abbr -a -g gco "git checkout"

  abbr -a -g gcl "git clean-all"
  abbr -a -g gcln "git clean-all -n"

  abbr -a -g gd "git diff"
  abbr -a -g gdc "git diff --cached"
  abbr -a -g gdt "git difftool"

  abbr -a -g gf "git fetch"
  abbr -a -g gfa "git fetch --all"

  abbr -a -g gg "git grep"

  abbr -a -g gi "git init"

  abbr -a -g gl "git log"

  abbr -a -g gm "git merge"
  abbr -a -g gmt "git mergetool"

  abbr -a -g gp "git pull"

  abbr -a -g gps "git push"
  abbr -a -g gpsn "git push -u origin"

  abbr -a -g gr "git rebase"

  abbr -a -g gra "git remote add"
  abbr -a -g grv "git remote -v"

  abbr -a -g grs "git reset"
  abbr -a -g grsh "git reset --hard"

  abbr -a -g gs "git st"
  abbr -a -g gsh "git stash-all"
  abbr -a -g gsl "git stash list"
  abbr -a -g gsp "git stash pop"
end

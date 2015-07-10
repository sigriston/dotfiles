function p
  set -l projectsPath "$HOME/Projects"
  set -l resultFile "$TMPDIR/p.fzf.result"
  ls -1 $projectsPath | fzf > $resultFile
  set -l destPath "$projectsPath/"(cat $resultFile)
  cd $destPath
  rm -f $resultFile
end

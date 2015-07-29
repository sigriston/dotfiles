function v -d "Vagrant shortcut function/alias"
  set -l command $argv[1]
  set -e argv[1]

  switch "$command"
    case d
      set command "destroy"
    case df
      set command "destroy" "-f"
    case h
      set command "halt"
    case gst
      set command "global-status"
    case s
      set command "ssh"
    case st
      set command "status"
  end

  vagrant $command $argv
end

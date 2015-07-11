# emacs shortcuts
# ---------------
function ec
  if pgrep -q Emacs
    emacsclient -n $argv[1]
  else
    set -l filePath (pwd)'/'$argv[1]
    which osascript > /dev/null ^&1; and \
      osascript -e 'tell application "Emacs"' \
                -e '  activate' \
                -e '  open "'$filePath'"' \
                -e 'end tell'
  end
end

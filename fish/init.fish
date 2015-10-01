if test -n "$NDENV_ROOT"
  set PATH $NDENV_ROOT/bin $PATH
  set PATH $NDENV_ROOT/shims $PATH
else
  set PATH $HOME/.ndenv/bin $PATH
  set PATH $HOME/.ndenv/shims $PATH
end

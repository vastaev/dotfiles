#XDG vars
set -xU XDG_CONFIG_HOME $HOME/.config
set -xU XDG_DATA_HOME $HOME/.local/share
set -xU XDG_STATE_HOME $HOME/.local/state
set -xU XDG_CACHE_HOME $HOME/.cache

#editor
set -xU EDITOR "codium --wait"

#spacemacs
set -xU SPACEMACSDIR $XDG_CONFIG_HOME/spacemacs

#starship launch
starship init fish | source

#asdf
source /usr/local/opt/asdf/libexec/asdf.fish
. ~/.asdf/plugins/java/set-java-home.fish

if status is-interactive
  #auto-warpify
  printf '\eP$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "fish"}}\x9c'
end

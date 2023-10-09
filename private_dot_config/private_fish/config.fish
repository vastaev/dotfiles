if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -xU XDG_CONFIG_HOME $HOME/.config
set -xU XDG_DATA_HOME $HOME/.local/share
set -xU XDG_STATE_HOME $HOME/.local/state
set -xU XDG_CACHE_HOME $HOME/.cache
set -xU SPACEMACSDIR $XDG_CONFIG_HOME/spacemacs

starship init fish | source


# XDG vars
set -xU XDG_CONFIG_HOME $HOME/.config
set -xU XDG_DATA_HOME $HOME/.local/share
set -xU XDG_STATE_HOME $HOME/.local/state
set -xU XDG_CACHE_HOME $HOME/.cache

# editor
set -xU EDITOR "nvim"

# spacemacs
set -xU SPACEMACSDIR $XDG_CONFIG_HOME/spacemacs

# go env
set -xU GOPATH (go env GOPATH)
set -xU PATH $PATH (go env GOPATH)/bin
set -xU GOBIN (go env GOPATH)/bin

# user functions
for path in ~/.config/fish/functions ~/.config/fish/user_functions
    if not contains $path $fish_function_path
        set fish_function_path $path $fish_function_path
    end
end

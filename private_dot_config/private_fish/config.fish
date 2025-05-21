# starship 
starship init fish | source

# asdf
#source /opt/homebrew/opt/asdf/libexec/asdf.fish
#. ~/.asdf/plugins/java/set-java-home.fish

# if status is-interactive
#   #auto-warpify
#   printf '\eP$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "fish"}}\x9c'
# end

# direnv hook
direnv hook fish | source

# fzf
fzf --fish | source

# zoxide
zoxide init fish --cmd c | source

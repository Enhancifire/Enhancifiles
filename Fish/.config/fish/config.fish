starship init fish | source
set -gx LIBGL_ALWAYS_INDIRECT 1 #GWSL


set -x PATH "/mnt/e/Development/flutter/bin" $PATH
set -x PATH "/home/reaperfs/.cargo/bin" $PATH
set -x PATH "/home/reaperfs/.local/bin" $PATH

# Path Alias
alias proj "cd ~/Projects/"
alias g "git"
alias gs "git status"

alias v "nvim"

lua ~/.config/fish/conf.d/z.lua/z.lua --init fish | source

eval "tmux attach -t base || tmux new -s base"

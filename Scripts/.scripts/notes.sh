#!/usr/bin/env bash
# tmux -u new-session -A -s ReaperGaruda
# kitty -e tmux -u new-session -A -s ReaperGaruda


if ! tmux has-session -t="Notes" 2> /dev/null; then
    # echo "Hi"
    tmux -u new-session -ds "Notes" -c "$HOME/Notes/" "nvim '00 - Maps of Content/000 Index.md'"
    # kitty -e tmux -u new-session -A -s "Notes" -c "$HOME/Notes/"
    # nvim "00 - Maps of Content/000 Index.md"
    # tmux send-keys -t "Notes" "nvim '00 - Maps of Content/000 Index.md'"
# else
    # kitty -e tmux attach -t "Notes"
fi
kitty -e tmux attach -t "Notes"

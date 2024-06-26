set fish_greeting
# function fish_greeting
#      pokemon-colorscripts -r --no-title
# end


if status --is-interactive
   source (/usr/bin/starship init fish --print-full-init | psub)
end

set -x LANG en_IN.UTF-8

# Setting up aliases
if test -d "$HOME/.config/fish/aliases"
  source $HOME/.config/fish/aliases/aliases.fish
  source $HOME/.config/fish/aliases/nvim.fish
  source $HOME/.config/fish/aliases/arch_packages.fish
  source $HOME/.config/fish/aliases/django_aliases.fish
  source $HOME/.config/fish/aliases/fedora.fish
  source $HOME/.config/fish/aliases/git.fish
  source $HOME/.config/fish/aliases/projects.fish
end


if test -d $HOME/.config/fish/themes/rose-pine.fish
  source $HOME/.config/fish/themes/rose-pine.fish
end

if test -d "$HOME/Android/Sdk/platform-tools"
  set -p PATH "$HOME/Android/Sdk/platform-tools"
end

set -x FZF_DEFAULT_COMMAND "rg --files --hidden"

# Setting up functions
if test -d ~/.config/fish/functions
  source ~/.config/fish/functions/testproject.fish
end

# Add ~/.local/bin to PATH
if test -d $HOME/.local/bin
    if not contains -- $HOME/.local/bin $PATH
        set -p PATH $HOME/.local/bin
    end
end

# Add ~/.cargo/bin to PATH
if test -d $HOME/.cargo/bin
    if not contains -- $HOME/.cargo/bin $PATH
        set -p PATH $HOME/.cargo/bin
    end
end

if test -d $HOME/.pyenv
  set -Ux PYENV_ROOT $HOME/.pyenv
  set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
  pyenv init - | source
end

if test -d "$HOME/Development/flutter_linux/bin"
  set -x PATH "$HOME/Development/flutter/bin" $PATH
end
if test -d "$HOME/.pub-cache/bin"
  set -x PATH "$HOME/.pub-cache/bin" $PATH
end

# Make npm run without root
set -x NPM_CONFIG_PREFIX "$HOME/.npm-global"
set -x HYPRSHOT_DIR "$HOME/Pictures/Screenshots"
set -x PATH "$HOME/.npm-global/bin" $PATH
set -x PATH "$HOME/.npm-global/bin" $PATH
set -x PATH "$HOME/.emacs.d/bin" $PATH

set -x PATH "$HOME/.local/share/nvim/mason/" $PATH
set -x EDITOR "/usr/bin/nvim"
set -x CHROME_EXECUTABLE '/usr/bin/brave'

##eval "tmux attach -t base || tmux new -s base"

## Functions
# Functions needed for !! and !$ https://github.com/oh-my-fish/plugin-bang-bang
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

if [ "$fish_key_bindings" = fish_vi_key_bindings ];
  bind -Minsert ! __history_previous_command
  bind -Minsert '$' __history_previous_command_arguments
else
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
end

# Fish command history
function history
    builtin history --show-time='%F %T '
end

function backup --argument filename
    cp $filename $filename.bak
end

# Copy DIR1 DIR2
function copy
    set count (count $argv | tr -d \n)
    if test "$count" = 2; and test -d "$argv[1]"
	set from (echo $argv[1] | trim-right /)
	set to (echo $argv[2])
        command cp -r $from $to
    else
        command cp $argv
    end
end


# Get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# Recent installed packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"

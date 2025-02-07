source /home/fs144/.config/fish/sourcing.fish

# overwrite greeting
# potentially disabling fastfetch
function fish_greeting
   # smth smth
end

if test -d "$HOME/development/flutter_linux/bin"
  set -p PATH "$HOME/development/flutter_linux/bin"
end

set -x FZF_DEFAULT_COMMAND "rg --files --hidden"

if test -d "$HOME/.local/bin"
  if not contains -- $HOME/.local/bin $PATH
    set -p PATH $HOME/.local/bin
  end
end

if test -d $HOME/.cargo/bin
    if not contains -- $HOME/.cargo/bin $PATH
        set -p PATH $HOME/.cargo/bin
    end
end

if test -d $HOME/.config/emacs/bin
    if not contains -- $HOME/.config/emacs/bin $PATH
        set -p PATH $HOME/.config/emacs/bin
    end
end

if test -d $HOME/.pub-cache/bin
    if not contains -- $HOME/.pub-cache/bin $PATH
        set -p PATH $HOME/.pub-cache/bin
    end
end

if test -d $HOME/.scripts
    if not contains -- $HOME/.scripts $PATH
        set -p PATH $HOME/.scripts
    end
end

# if test -d $HOME/Android/Sdk/cmdline-tools/latest/bin
#     if not contains -- $HOME/Android/Sdk/cmdline-tools/latest/bin $PATH
#         set -p PATH $HOME/Android/Sdk/cmdline-tools/latest/bin
#     end
# end

# if test -d $HOME/Android/Sdk/platform-tools
#     if not contains -- $HOME/Android/Sdk/platform-tools
#         set -p PATH $HOME/Android/Sdk/platform-tools
#     end
# end

set -x NPM_CONFIG_PREFIX "$HOME/.npm-global"
set -x PATH "$HOME/.npm-global/bin" $PATH
set -x EDITOR "/usr/bin/nvim"

set -x OLLAMA_MODELS "/home/fs144/Drives/Data/Development/Ollama/Models"
set -x OLLAMA_HOST "0.0.0.0:11434"

fish_add_path /home/fs144/.spicetify

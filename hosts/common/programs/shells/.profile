export LANG=en_US.utf-8
export EDITOR="$HOME/.dotfiles/scripts/emt"
export VISUAL="$HOME/.dotfiles/scripts/emc"
# export MANPAGER="/usr/bin/bash -c 'col -bx | /usr/bin/bat -l man -p'"
export BROWSER="brave"
export ALTERNATE_EDITOR="emacsclient"
export SUDO_EDITOR="emc"
export XCURSOR_SIZE=24
export BAT_THEME=OneHalfDark
export XCURSOR_SIZE=24
export ALTERNATE_EDITOR="emacsclient"
export BAT_THEME=OneHalfDark
export XDG_DATA_DIRS="$HOME/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share":$XDG_DATA_DIRS
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export CARGO_HOME="$HOME/.local/share/cargo"
export RUSTUP_HOME="$HOME/.local/share/rustup"
export GNUPG_HOME="$HOME/.local/share/gnupg"
export JUPYTER_CONFIG_DIR=$HOME/.config/jupyter 
export GSETTINGS_SCHEMA_DIR="/usr/share/glib-2.0/schemas" 
export GTK_FILE_CHOOSER_BACKEND="file:///$HOME/.local/share/applications/ranger-file-picker.desktop"
export MOZ_ENABLE_WAYLAND=1
export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"
export SQLITE_HISTORY="$XDG_CACHE_HOME"/sqlite_history
export GUILE_HISTORY="$XDG_STATE_HOME/guile/history"
# export PATH="$HOME/bin:$HOME/.Podman/bin:$HOME/Applications:$HOME/.dotfiles/scripts:$HOME/.dotfiles/scripts/arcolinux:$HOME/.local/share/cargo/bin:$PATH"
export PATH="$HOME/bin:$HOME/.Podman/bin:$HOME/Applications:$HOME/.local/share/cargo/bin:$PATH"
export FZF_DEFAULT_OPTS="--layout=reverse --border=bold --border=rounded --margin=3% --color=dark"
# export DOCKER_HOST=unix:///run/user/1000/docker.sock
# set -U fish_user_paths "$HOME/.Podman/bin" "$HOME/Applications" "$HOME/.dotfiles/scripts" "$HOME/.dotfiles/scripts/arcolinux" $fish_user_paths
# don't add TEXLIVE programs to fish paths because it'll pollute autosuggestions
# export DOCKER_CONFIG="$HOME/.local/share/docker/"
# export GTK_USE_PORTAL=1 # configures kde portal for gtk apps
# export ELECTRON_OZONE_PLATFORM_HINT=wayland

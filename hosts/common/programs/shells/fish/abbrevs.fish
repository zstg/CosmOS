#!/usr/bin/env fish
# abbr -a pacman sudo pacman # use M-s for this
abbr -a s sudo
abbr -a md mkdir -p
abbr -a db distrobox
abbr -a ip ip -br -c
abbr -a cr cargo run
abbr -a crr cargo run --release
abbr -a boes org.gnome.Boxes
abbr -a rustdocs rustup doc std
abbr -a npacman sudo nano /etc/pacman.conf
abbr -a dcd docker compose down
abbr -a dcu docker compose up
abbr -a dcud docker compose up -d

# NIXOS ALIASES
# abbr -a rebuild clear && sudo nixos-rebuild --fast 
abbr -a rebuild-switch "clear && sudo nixos-rebuild --fast switch --flake ~/.nixos/#"
abbr -a nixos-test "clear && sudo nixos-rebuild --fast build --flake ~/.nixos/#"
abbr -a rebuild-test "clear && sudo nixos-rebuild --fast test --flake ~/.nixos/#"
# abbr -a nix-shell "HOME=/home/stig/.cache nix-shell"
abbr -a nix-shellp "HOME=/home/stig/.cache nix-shell -p"
abbr -a nix-search nix search nixpkgs
abbr -a ai appimage-run
abbr -a ai-run appimage-run
# abbr -a gcc clang
# abbr -a g++ clang++
abbr -a cd z
abbr -a copy "wl-copy < "
abbr -a doom "gzdoom -iwad ~/.config/gzdoom/doom.wad -file ~/.config/gzdoom/D4Tv2.5.pk3"
abbr -a bhc "builtin history clear"

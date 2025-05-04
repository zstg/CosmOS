{...}: {
  imports = [
    ./programs
    ./services
    ./boot.nix
    ./home.nix
    ./gtk.nix
    ./fonts.nix
    ./misc.nix
    ./locale.nix
    ./dotfiles-path.nix
    ./systemd.nix
    # ./stylix.nix
  ];
}

{...}: {
  imports = [
    # ./programs
    # ./services
    ./boot.nix
    ./configuration.nix
    ./home.nix
    ./gtk.nix
    ./fonts.nix
    ./misc.nix
    # ./locale.nix # BROKEN
    ./systemd.nix
    ./stylix.nix
  ];
}

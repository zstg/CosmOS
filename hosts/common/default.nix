{...}: {
  imports = [
    ./programs
    ./services
    ./boot
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

{...}: {
  imports = [
    ../../common
    ../home.nix
    ./nm-applet.nix
    ./dconf.nix
    ./light.nix
    ./mako
    ./btop
    ./cava
    ./ranger
    ./stylix.nix
    ./zellij
  ];
  # systemd.user.startServices = "sd-switch";
}

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
    ./zellij
    ./WMs
    ./waybar
  ];
  # systemd.user.startServices = "sd-switch";
}

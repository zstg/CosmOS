{...}: {
  imports = [
    ../../common
    ./nm-applet.nix
    ./dconf.nix
    ./light.nix
    ./mako
    ./btop
    ./cava
    ./ranger
    ./zellij
    ./WMs
    ./vicinae
    ./waybar
  ];
  # systemd.user.startServices = "sd-switch";
}

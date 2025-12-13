{...}: {
  imports = [
    ../../common
    ./nm-applet.nix
    ./dconf.nix
    ./light.nix
    ./hyprland
  ];
  # systemd.user.startServices = "sd-switch";
}

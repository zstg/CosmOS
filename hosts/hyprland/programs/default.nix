{...}: {
  imports = [
    ../../common
    ../home.nix
    ./nm-applet.nix
    ./dconf.nix
    ./light.nix
    ./rice
  ];
  # systemd.user.startServices = "sd-switch";
}

{...}: {
  imports = [
    ../../common
    ./nm-applet.nix
    ./dconf.nix
    ./light.nix
    ./mako
    ./eww
    ./btop
    ./cava
    ./ranger
    ./zellij
    ./waybar
  ];
  # systemd.user.startServices = "sd-switch";
}

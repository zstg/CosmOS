{...}: {
  imports = [
    ../../common
    ./nm-applet.nix
    ./dconf.nix
    ./light.nix
    # ./mako
    ./eww
    ./btop
    ./cava
    ./ranger
    ./zellij
    ./waybar
    ./swaync
  ];
  # systemd.user.startServices = "sd-switch";
}

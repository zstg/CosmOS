{pkgs,...}: {
  services.envfs.enable = true;
  environment.variables = {
    NIX_STRIP_DEBUG="1";
    TERMINAL = "kitty";
    PATH = "dots/scripts:$PATH";
    MOZ_ENABLE_WAYLAND = "true";
    # GSETTINGS_SCHEMA_DIR = "${pkgs.gsettings-desktop-schemas}/share/glib-2.0/schemas"; # not reqd anymore, gsettings is not being used
  };
  # system.activationScripts.changeUinputPermissions = {
  #   text = ''
  #     sudo modprobe uinput
  #     chmod a+rw /dev/uinput
  #   '';
  # };
  systemd.sleep.extraConfig = "HibernateDelaySec=3600"; # "HibernateDelaySec=3600\nOtherOptions\nMoreOptions"
  programs.nix-ld.enable = true;
  programs.xwayland.package = pkgs.xwayland; # Prevents recompiling XWayland from source
}

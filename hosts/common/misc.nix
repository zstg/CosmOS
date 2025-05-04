{...}: {
  environment.variables = {
    TERMINAL = "kitty";
    PATH = "dots/scripts:$PATH";
    MOZ_ENABLE_WAYAND = "true"; # since i'm gonna be running Hyprland, Librewolf'll benefit from this
    # GSETTINGS_SCHEMA_DIR = "${pkgs.gsettings-desktop-schemas}/share/glib-2.0/schemas"; # not reqd anymore, gsettings is not being used
  };
  # system.activationScripts.changeUinputPermissions = {
  #   text = ''
  #     sudo modprobe uinput
  #     chmod a+rw /dev/uinput
  #   '';
  # };
  hardware.cpu.intel.updateMicrocode = true;
  systemd.sleep.extraConfig = "HibernateDelaySec=3600"; # "HibernateDelaySec=3600\nOtherOptions\nMoreOptions"
  programs.nix-ld.enable = true;
}

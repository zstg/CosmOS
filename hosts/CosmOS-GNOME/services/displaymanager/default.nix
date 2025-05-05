{lib,...}: {
  services.displayManager.autoLogin = {
    enable = true;
    user = "stig";
  };
  services.xserver = {
    # enable = true;
    displayManager = {
      lightdm.enable = lib.mkForce false;
      gdm = {
        enable = true;
        autoSuspend = false;  # Disable automatic suspend
      };
    };
  };
}
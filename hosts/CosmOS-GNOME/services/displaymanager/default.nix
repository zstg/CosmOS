{lib,...}: {
  services.xserver = {
    # enable = true;
    displayManager.lightdm.enable = lib.mkForce false;
    displayManager.gdm = {
      enable = true;
      autoSuspend = false;  # Disable automatic suspend
      autologin = {
        user = lib.mkForce "stig";
      };
    };
  }
}
{...}: {
  services = {
    logind = {
      lidSwitch = "suspend-then-hibernate";
      extraConfig = ''
        DefaultTimeoutStopSec = 5s
        HandlePowerKey = ignore # semicolons required??
      '';
    };
  };
}

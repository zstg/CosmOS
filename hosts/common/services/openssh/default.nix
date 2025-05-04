{...}: {
  services = {
    openssh = {
      enable = true;
      startWhenNeeded = false;
      openFirewall = true;
      settings = {
        X11Forwarding = true;
        PasswordAuthentication = true;
        PermitRootLogin = "no";
      };
    };
  };
}

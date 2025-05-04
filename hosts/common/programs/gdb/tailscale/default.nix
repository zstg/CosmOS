{...}:{
  services = {
    tailscale = {
      enable = true;
      useRoutingFeatures = "both"; # what does this actually do?
      port = 0; # auto-selects the port
      extraSetFlags = [ "--advertise-exit-node" ];
      disableTaildrop = false;
    };
  };
}

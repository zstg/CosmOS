{...}: {
  networking = {
    # wireless.enable = false; # not compatible with networkmanager.enable
    # NOT a good idea to uncomment this /here/ !
    # interfaces.wlp2s0.ipv4.addresses = [{
    #   address = "192.168.0.123";
    #   prefixLength = 24;
    # }];
    # defaultGateway = "192.168.1.1";
    # nameservers = [ "8.8.8.8", "4.4.4.4" ];
     networkmanager.enable = true;
     firewall = {
        enable = true;
        allowedTCPPorts = [ 80 443 53317 ]; # 53317 is for LocalSend
        allowedUDPPortRanges = [
          { from = 4000; to = 4007; }
          { from = 53315; to = 53318; }
          { from = 8000; to = 8010; }
        ];
      };
    };
}

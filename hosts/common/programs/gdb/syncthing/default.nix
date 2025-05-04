{...}: {
  home-manager.users.stig.services = {
    syncthing = {
      enable = true;
      # tray = true; # this option exists only for the home-manager version
      # user = "stig"; # Don't create a syncthing user # permission issues if enabled
      # systemService = true;
      /*
      settings = {
        devices = {
          HyperOS = {
            addresses = [ "tcp://192.168.0.54:22000" ];  # Add the default Syncthing port
            id = "63F2JJ4-2LSDMXD-UOKIQAC-LNO4RTT-NEJCKAM-QG3UQUB-KHYEB2A-OZX5VAG";  # Phone's Syncthing ID
          };
        };
        folders = {
          "Documents/Notes" = {  # Simplified the path (it's relative to the Syncthing folder structure). May need to be changed!
            id = "qnsow-tfcbg";
            path = "/home/stig/Documents/Notes";
            devices = [ "HyperOS" ];
          };
        };
      };
      */
    };
  };
}

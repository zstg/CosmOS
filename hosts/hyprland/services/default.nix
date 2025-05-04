{...}: {
  imports = [
    ../../common/services
    # ./flatpak
    ./fwupd
    # ./syncthing
    ./stigmacs
    ./desktopmanager
    ./gpg-unlock
    ./power-profiles-daemon
    ./xserver
    ./syncthing
    ./virtualisation
    # ./tailscale
    # ./printing
  ];
  networking.hostName = "Krypton";
}

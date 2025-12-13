{...}: {
  imports = [
    ./displaymanager
    ./desktopmanager
    ./power-profiles-daemon
    ./udiskie
  ];
  networking.hostName = "CosmOS";
}

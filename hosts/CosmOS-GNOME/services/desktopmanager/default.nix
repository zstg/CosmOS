{ pkgs, lib, ... }: {
  services.xserver = {
    enable = true;
    desktopManager.gnome.enable = true;
    xkb.layout = "us";
    xkb.options = "terminate:ctrl_alt_bksp";
  };

  services.libinput.enable = true;

  environment.gnome.excludePackages = with pkgs; [
    cheese
    epiphany
    evince
    gedit
    geary
    gnome-calendar
    gnome-characters
    gnome-clocks
    gnome-contacts
    gnome-disk-utility
    gnome-logs
    gnome-maps
    gnome-music
    gnome-text-editor
    gnome-photos
    gnome-screenshot
    gnome-system-monitor
    # gnome-terminal
    gnome-weather
    gnome-tour
    # nautilus
    simple-scan
    totem
    yelp
    gnome-connections        
    gnome-remote-desktop
    gnome-boxes              
    gnome-user-docs          
    gnome-initial-setup      
    gnome-backgrounds        
    gnome-software           
    gnome-shell-extensions                  
    rygel                   
    sushi                   
    gnome-user-share 
    baobab
    dconf-editor
    eog
    file-roller
    gnome-calculator
    gnome-contacts
    gnome-font-viewer
    gnome-logs
    gnome-nettool
    gnome-power-manager
    gnome-sound-recorder
    gnome-weather
    seahorse
    zenity
  ];

  # Disable all optional GNOME services
  services.gnome = {
    core-apps.enable = false;
    games.enable = false;
    localsearch.enable = false;
    tinysparql.enable = false;
    evolution-data-server.enable = lib.mkForce false;
    rygel.enable = false;
    sushi.enable = false;
    gnome-user-share.enable = false;
    core-developer-tools.enable = false;
  };

  services.printing.enable = false;
  hardware.bluetooth.enable = false;

  environment.systemPackages = with pkgs; [
    gnomeExtensions.user-themes
    gnomeExtensions.user-themes-x
    gnomeExtensions.blur-my-shell
    # gnomeExtensions.burn-my-windows
    gnomeExtensions.dash-to-dock
    gnomeExtensions.logo-menu
    # gnomeExtensions.space-bar
    # gnomeExtensions.forge
    
  ];
}

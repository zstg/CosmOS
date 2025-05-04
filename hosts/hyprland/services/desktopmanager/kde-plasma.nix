{pkgs,...}:{
  programs = {
    kdeconnect.enable = true;
  };
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    konsole
  ];
  home-manager.users.stig.home.packages = with pkgs; [
  	kdePackages.breeze-gtk
  	kdePackages.plasma-pa
  	kdePackages.plasma-nm
  	bluez bluez-tools kdePackages.bluedevil
  	kdePackages.plasma-browser-integration
  	kdePackages.plasma-integration
  	# libsForQt5.applet-window-appmenu
  	# libappindicator libappindicator-gtk3
  ];
}

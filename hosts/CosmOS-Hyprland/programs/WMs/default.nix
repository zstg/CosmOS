{pkgs,...}: {
  home-manager.users.stig.home.packages = with pkgs; [ networkmanagerapplet blueman eww grim slurp swappy playerctl swayosd ];
  imports = [
	  ./hyprland
	  ../waybar
  ];
}

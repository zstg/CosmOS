{pkgs,...}: {
  imports = [ 
    ./hyprland 
  ];
  home-manager.users.nixos.home.packages = with pkgs; [ networkmanagerapplet blueman eww grim slurp swappy playerctl swayosd ];
}

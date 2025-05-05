{ pkgs,... }: {
  home-manager.users.stig.home.packages = with pkgs; [
    polkit_gnome
  ];
}

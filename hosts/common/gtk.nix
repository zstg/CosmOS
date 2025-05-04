{pkgs,lib,...}: {
  home-manager.users.stig = {
    /*  
    home.pointerCursor = {
      gtk.enable = true;
      package = lib.mkForce pkgs.bibata-cursors;	
      name = "Bibata-Modern-Ice";
    };
    home.packages = with pkgs;[ glib whitesur-kde whitesur-cursors banana-cursor]; # provides gsettings
*/
    gtk = {
      enable = true;
      
      # theme = {
      # package = lib.mkForce pkgs.whitesur-gtk-theme; # pkgs.kdePackages.breeze-gtk;
      # name = lib.mkForce "whitesur-gtk-theme"; # "Breeze-GTK";
      # };

      # iconTheme = {
      #   name = "Papirus-Dark";
      #   package = lib.mkForce pkgs.papirus-icon-theme;
      # };
    };
  };
}

{pkgs,lib,...}: 
let 
  systemfont = { package = pkgs.nerd-fonts.jetbrains-mono; name = "JetBrainsMono NF"; };
in
{

  home-manager.users.stig = {
    stylix.iconTheme = {
      enable = true;
      dark = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    gtk.enable = true;
  };

  stylix = {
    enable = true;
  	autoEnable = true;
    homeManagerIntegration.followSystem = true;
  	base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";
    polarity = "dark";
    targets = {
/*
      qt = {
        enable = true;
        platform = "qtct";
      };
*/
      plymouth.enable = false; # use adi1090x's themes collection
  	  chromium.enable = false;
  	  console.enable = false;
      fish.enable = true;
      gtk = {
        enable = true;
        # icon theme is set in gtk.nix
        # flatpakSupport.enable = true;
      };
      
/*      
      kde = {
        enable = false;
        decorations = "__aurorae__svg__WhiteSur-dark";
      };
*/
    };
      
    cursor = {
      package = lib.mkDefault pkgs.bibata-cursors;
      name = lib.mkDefault "Bibata-Modern-Ice";
      size = 30; # TODO set in gtk.nix
    };    
    fonts = {
      monospace = systemfont;
      #serif = systemfont;
      #sansSerif = systemfont;
      /* # Stick to default emoji config
      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
      */
    };
    /*
    baseScheme = {
      base00 = "282828";
    };
    */
  };
}

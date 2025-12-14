{pkgs, lib, ...}: {
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
  };
  home-manager.users.nixos= {
    home.file = {
      ".config/waybar/config.jsonc".text = builtins.readFile ./waybar_config/.config/waybar/config.jsonc;
      ".config/waybar/style.css".text = builtins.readFile ./waybar_config/.config/waybar/style.css;
    };
  };
}

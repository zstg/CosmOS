{ pkgs, config, lib, home-manager, ... }: {
  programs.hyprland = {
  	enable = true;
  	xwayland.enable = true;
  };
  programs.hyprlock.enable = true;
  services.hypridle.enable = true;
  home-manager.users.stig.home = {
    packages = with pkgs; [ hyprpaper hyprcursor ];
/*    
    file = {
      ".config/hypr/hypridle.conf".text = builtins.readFile ./hypridle.conf;
      ".config/hypr/hyprland.conf".text = builtins.readFile ./hyprland.conf;
      ".config/hypr/hyprlock.conf".text = builtins.readFile ./hyprlock.conf;
      ".config/hypr/hyprpaper.conf".text = builtins.readFile ./hyprpaper.conf;
      ".config/hypr/pyprland.toml".text = builtins.readFile ./pyprland.toml;
    };
*/    
    activation.hyprlandSymlinks = lib.mkAfter ''
      mkdir -p ~/.config/hypr

      ln -sf ~/.nixos/hosts/Krypton/programs/rice/WMs/hyprland/hyprland.conf ~/.config/hypr/hyprland.conf
      ln -sf ~/.nixos/hosts/Krypton/programs/rice/WMs/hyprland/hypridle.conf ~/.config/hypr/hypridle.conf
      ln -sf ~/.nixos/hosts/Krypton/programs/rice/WMs/hyprland/hyprlock.conf ~/.config/hypr/hyprlock.conf
      ln -sf ~/.nixos/hosts/Krypton/programs/rice/WMs/hyprland/hyprpaper.conf ~/.config/hypr/hyprpaper.conf
      ln -sf ~/.nixos/hosts/Krypton/programs/rice/WMs/hyprland/pyprland.toml ~/.config/hypr/pyprland.toml
    '';
  };
}

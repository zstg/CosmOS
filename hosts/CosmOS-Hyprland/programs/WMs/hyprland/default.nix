{ pkgs, config, lib, home-manager, ... }: {
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  programs.hyprlock.enable = true;
  services.hypridle.enable = true;
  home-manager.users.nixos.home = {
    packages = with pkgs; [ hyprpaper hyprcursor ];
    file = {
      ".config/hypr/hypridle.conf".text = builtins.readFile ./hypridle.conf;
      ".config/hypr/hyprland.conf".text = builtins.readFile ./hyprland.conf;
      ".config/hypr/hyprlock.conf".text = builtins.readFile ./hyprlock.conf;
      ".config/hypr/hyprpaper.conf".text = builtins.readFile ./hyprpaper.conf;
      ".config/hypr/pyprland.toml".text = builtins.readFile ./pyprland.toml;
    };
  };
}

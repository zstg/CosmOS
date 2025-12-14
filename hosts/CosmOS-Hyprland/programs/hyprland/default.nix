{ pkgs, config, lib, home-manager, ... }: {
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  programs.hyprlock.enable = true;
  services.hypridle.enable = true;

  home-manager.users.nixos = {
    programs.hyprlock.enable = true;
    services.polkit-gnome.enable = true;
    wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;
      systemd.enable = lib.mkDefault false;
      package = pkgs.hyprland;
      portalPackage = pkgs.xdg-desktop-portal-hyprland;
    };
    home = {
      packages = with pkgs; [ hyprpaper hyprcursor ];
      sessionPath = [
        "~/.nixos/hosts/CosmOS-Hyprland/programs/hyprland/hyprland_config/usr/local/bin"
      ];
      file = {
        ".config/hypr/autostart.conf".text = builtins.readFile  ./hyprland_config/.config/hypr/autostart.conf;
        ".config/hypr/keybinds.conf".text = builtins.readFile  ./hyprland_config/.config/hypr/keybinds.conf;
        ".config/hypr/hypridle.conf".text = builtins.readFile  ./hyprland_config/.config/hypr/hypridle.conf;
        ".config/hypr/hyprland.conf".text = builtins.readFile  ./hyprland_config/.config/hypr/hyprland.conf;
        ".config/hypr/hyprlock.conf".text = builtins.readFile  ./hyprland_config/.config/hypr/hyprlock.conf;
        ".config/hypr/hyprpaper.conf".text = builtins.readFile ./hyprland_config/.config/hypr/hyprpaper.conf;
      };
    };
  };
}

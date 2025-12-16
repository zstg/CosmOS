{ pkgs, config, lib, system, inputs,  ... }: {
  programs.niri = {
    enable = true;
    useNautilus = true;
  };
  programs.hyprlock.enable = true;
  services.hypridle.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
    config.common.default = "gnome";
  };
  home-manager.users.nixos = {
    programs.hyprlock = {
      enable = true;
      extraConfig = builtins.replaceStrings [ "/usr" ] [ "${inputs.stratos-wallpapers.packages.${system}.default}" ] (builtins.readFile ../../../CosmOS-Hyprland/programs/hyprland/hyprland_config/.config/hypr/hyprlock.conf);
    };
    services.polkit-gnome.enable = true;
    home = {
      packages = with pkgs; [ hyprpaper hyprcursor ];
      file = {
        ".config/niri/config.kdl".text = builtins.readFile              ./niri_config/.config/niri/config.kdl;
        ".config/hypr/hypridle.conf".text = builtins.readFile           ../../../CosmOS-Hyprland/programs/hyprland/hyprland_config/.config/hypr/hypridle.conf;
        ".config/hypr/hyprpaper.conf".text = builtins.replaceStrings    [ "/usr" ] [ "${inputs.stratos-wallpapers.packages.${system}.default}" ] (builtins.readFile ../../../CosmOS-Hyprland/programs/hyprland/hyprland_config/.config/hypr/hyprpaper.conf);
      };
    };
  };
}

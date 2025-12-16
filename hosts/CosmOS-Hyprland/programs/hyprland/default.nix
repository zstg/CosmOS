{ pkgs, config, inputs, system, lib, ... }: {
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  programs.hyprlock.enable = true;
  services.hypridle.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
    config.common.default = "hyprland";
  };
  # TODO Replace /usr in the conf files with ${inputs.stratos-wallpapers.packages.${system}.default}/ using sed or some Nix function
  home-manager.users.nixos = {
    programs.hyprlock = {
      enable = true;
      extraConfig = builtins.replaceStrings [ "/usr" ] [ "${inputs.stratos-wallpapers.packages.${system}.default}" ] (builtins.readFile ./hyprland_config/.config/hypr/hyprlock.conf);
    };
    services.polkit-gnome.enable = true;
    wayland.windowManager.hyprland = {
      # enable = true;
      # xwayland.enable = true;
      extraConfig = builtins.readFile ./hyprland_config/.config/hypr/hyprland.conf;
      # systemd.enable = lib.mkDefault false;
      package = pkgs.hyprland;
      portalPackage = pkgs.xdg-desktop-portal-hyprland;
    };
    home = {
      packages = with pkgs; [ hyprpaper hyprcursor ];
      sessionPath = [
        "~/.nixos/hosts/CosmOS-Hyprland/programs/hyprland/hyprland_config/usr/local/bin"
      ];
      file = {
        ".config/hypr/autostart.conf".text = builtins.readFile ./hyprland_config/.config/hypr/autostart.conf;
        ".config/hypr/keybinds.conf".text = builtins.readFile ./hyprland_config/.config/hypr/keybinds.conf;
        ".config/hypr/hypridle.conf".text = builtins.readFile ./hyprland_config/.config/hypr/hypridle.conf;
        ".config/hypr/hyprpaper.conf".text = builtins.replaceStrings [ "/usr" ] [ "${inputs.stratos-wallpapers.packages.${system}.default}" ] (builtins.readFile ./hyprland_config/.config/hypr/hyprpaper.conf);
      };
    };
  };
}

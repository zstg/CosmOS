{pkgs, lib, ...}: {
  home-manager.users.nixos = {
    services.swaync = {
      enable = true;
      settings = ./swaync_config/.config/swaync/config.json;
      # style = ./swaync_config/.config/swaync/style.css; # let Stylix handle it
    };
    home.file.".config/swaync/configSchema.json".text = builtins.readFile ./swaync_config/.config/swaync/configSchema.json;
  };
}

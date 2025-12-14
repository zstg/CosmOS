{pkgs, lib, ...}: {
  home-manager.users.nixos = {
    services.swaync.enable = true;
    home.file = {
      ".config/swaync/config.json".text = builtins.readFile ./swaync_config/.config/swaync/config.json;
      ".config/swaync/configSchema.json".text = builtins.readFile ./swaync_config/.config/swaync/configSchema.json;
      ".config/swaync/style.css".text = builtins.readFile ./swaync_config/.config/swaync/style.css;
    };
  };
}

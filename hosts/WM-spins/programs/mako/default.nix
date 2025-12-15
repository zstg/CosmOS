{pkgs, lib,...}: {
  home-manager.users.nixos = {
    services.mako.enable = true;
    home.file.".config/mako".text = builtins.readFile ./mako_config/.config/mako/config;
  };
}

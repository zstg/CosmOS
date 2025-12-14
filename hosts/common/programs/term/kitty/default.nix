{pkgs, lib,...}: {
  environment.systemPackages = [ pkgs.kitty ];
  home-manager.users.nixos.home = {
    # packages = [ pkgs.kitty ];
    file = {
      ".config/kitty/kitty.conf".text = builtins.readFile ./kitty_config/.config/kitty/kitty.conf;
      ".config/kitty/theme.conf".text = builtins.readFile ./kitty_config/.config/kitty/theme.conf;
    };
  };
}

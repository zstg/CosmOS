{lib,...}: {
  programs.fish = {
    enable = true;
  };
  home-manager.users.nixos = {
    home.file = {
      ".config/fish/aliases".text = builtins.readFile ./fish_config/.config/fish/aliases;
      ".config/fish/.profile".text = builtins.readFile ./fish_config/.config/fish/.profile;
      ".config/fish/git.fish".text = builtins.readFile ./fish_config/.config/fish/git.fish;
      ".config/fish/config.fish".text = builtins.readFile ./fish_config/.config/fish/config.fish;

      ".config/fish/functions" = {
        source = ./fish_config/.config/fish/functions;
        recursive = true;
      };
      
    };
  };
}

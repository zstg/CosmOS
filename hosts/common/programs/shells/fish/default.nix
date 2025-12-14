{lib,...}: {
  programs.fish = {
    enable = true;
  };
  # This symlink to .config/fish is required because NixOS and HM don't offer a way to set the configuration directory.
  home-manager.users.nixos.home.file.".config/fish" = {
    recursive = true;
    source = lib.fileset.toSource {
	  # folder that contains .config
      root = ./fish_config;
      
      # only include the .config/fish subtree
      fileset = lib.fileset.maybeMissing ./fish_config/.config/fish;
    };
  };
}

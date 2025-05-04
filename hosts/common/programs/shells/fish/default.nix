{lib,...}: {
  programs.fish = {
    enable = true;
  };
  # This symlink to .config/fish is required because NixOS and HM don't offer a way to set the configuration directory.
  home-manager.users.stig.home.file.".config/fish" = {
    recursive = true;
    source = lib.fileset.toSource { root = ./.; fileset = ./.; };
  };
  # If you want to symlink each individual file:
  # home-manager.users.stig.home.file.".config/fish/config.fish" = ./config.fish;
}

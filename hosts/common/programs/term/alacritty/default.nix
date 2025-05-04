{pkgs, lib,...}: {
  home-manager.users.stig.home = {
    packages = [ pkgs.alacritty ];
    file.".config/alacritty" = {
      recursive = true;
      source = lib.fileset.toSource { root = ./.; fileset = ./.; };
    };
  };
}

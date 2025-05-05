{pkgs, lib,...}: {
  programs.waybar = {
  	enable = true;
  	package = pkgs.waybar;
  };
  home-manager.users.stig.home = {
    file.".config/waybar" = {
      recursive = true;
      source = lib.fileset.toSource { root = ./.; fileset = ./.; };
    };
  };
}

{pkgs, lib,...}: {
  home-manager.users.stig.home = {
    packages = [ pkgs.libnotify pkgs.dunst ];
    file.".config/dunst" = {
      recursive = true;
      source = lib.fileset.toSource { root = ./.; fileset = ./.; };
    };
  };
}

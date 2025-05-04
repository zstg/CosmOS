{pkgs, lib,...}: {
  home-manager.users.stig.home = {
    packages = [ pkgs.polybar ];
    file.".config/polybar" = {
      recursive = true;
      source = lib.fileset.toSource { root = ./.; fileset = ./.; };
    };
  };
}

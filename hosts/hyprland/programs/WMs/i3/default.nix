{pkgs, lib,...}: {
  home-manager.users.stig.home = {
    packages = [ pkgs.i3 ];
    file.".config/i3" = {
      recursive = true;
      source = lib.fileset.toSource { root = ./.; fileset = ./.; };
    };
  };
}

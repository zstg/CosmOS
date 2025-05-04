{pkgs, lib,...}: {
  home-manager.users.stig.home = {
    packages = [ pkgs.xonsh ];
    file.".config/xonsh" = {
      recursive = true;
      source = lib.fileset.toSource { root = ./.; fileset = ./.; };
    };
  };
}


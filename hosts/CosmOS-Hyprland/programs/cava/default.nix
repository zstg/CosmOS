{pkgs, lib,...}: {
  home-manager.users.stig.home = {
    packages = [ pkgs.cava ];
    file.".config/cava" = {
      recursive = true;
      source = lib.fileset.toSource { root = ./.; fileset = ./.;};
    };
  };
}

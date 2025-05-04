{pkgs, lib,...}: {
  home-manager.users.stig.home = {
    packages = [ pkgs.lf ];
  };
  file.".config/lf" = {
    recursive = true;
    source = lib.fileset.toSource { root = ./.; fileset = ./.;};
  };
}

{pkgs, lib,...}: {
  home-manager.users.stig.home = {
    packages = [ pkgs.albert ];
  };
  file.".config/albert" = {
    recursive = true;
    source = lib.fileset.toSource { root = ./.; fileset = ./.;};
  };
}

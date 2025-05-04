{pkgs, lib,...}: {
  home-manager.users.stig.home = {
    packages = [ pkgs.swaync ];
  };
  file.".config/swaync" = {
    recursive = true;
    source = lib.fileset.toSource { root = ./.; fileset = ./.;};
  };
}

{pkgs, lib,...}: {
  home-manager.users.stig.home = {
    packages = [ pkgs.leftwm ];
  };
  file.".config/leftwm" = {
    recursive = true;
    source = lib.fileset.toSource { root = ./.; fileset = ./.;};
  };
}

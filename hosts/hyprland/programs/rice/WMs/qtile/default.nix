{pkgs, lib,...}: {
  home-manager.users.stig.home = {
    packages = [ pkgs.qtile-unwrapped ];
  };
  file.".config/qtile" = {
    recursive = true;
    source = lib.fileset.toSource { root = ./.; fileset = ./.;};
  };
}

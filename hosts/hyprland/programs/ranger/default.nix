{pkgs, lib,...}: {
  home-manager.users.stig.home = {
    packages = [ pkgs.ranger ];
    file.".config/ranger" = {
      recursive = true;
      source = lib.fileset.toSource { root = ./.; fileset = ./.;};
    };
  };
}

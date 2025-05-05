{pkgs, lib,...}: {
  home-manager.users.stig.home = {
    packages = [ pkgs.btop ];
    file.".config/btop" = {
      recursive = true;
      source = lib.fileset.toSource { root = ./.; fileset = ./.;};
    };
  };
}

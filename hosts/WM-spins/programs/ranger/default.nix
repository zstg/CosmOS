{pkgs, lib, ...}: {
  home-manager.users.nixos.home = {
    packages = [ pkgs.ranger ];
    file.".config/ranger" = {
      recursive = true;
      source = lib.fileset.toSource { root = ./.; fileset = ./.;};
    };
  };
}

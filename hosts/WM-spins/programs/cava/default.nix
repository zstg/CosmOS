{pkgs, lib, ...}: {
  home-manager.users.nixos.home = {
    packages = [ pkgs.cava ];
    file.".config/cava" = {
      recursive = true;
      source = lib.fileset.toSource { root = ./.; fileset = ./.;};
    };
  };
}

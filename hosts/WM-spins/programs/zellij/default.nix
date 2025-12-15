{pkgs, lib, ...}: {
  home-manager.users.nixos.home = {
    packages = [ pkgs.zellij ];
    file.".config/zellij" = {
      recursive = true;
      source = lib.fileset.toSource { root = ./.; fileset = ./.; };
    };
  };
}

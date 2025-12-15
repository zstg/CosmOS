{pkgs, lib, ...}: {
  home-manager.users.nixos.home = {
    packages = [ pkgs.btop ];
    file.".config/btop" = {
      recursive = true;
      source = lib.fileset.toSource { root = ./.; fileset = ./.;};
    };
  };
}

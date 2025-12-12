{pkgs, lib, uzer, ...}: {
  home-manager.users.${uzer}.home = {
    packages = [ pkgs.libnotify pkgs.dunst ];
    file.".config/dunst" = {
      recursive = true;
      source = lib.fileset.toSource { root = ./.; fileset = ./.; };
    };
  };
}

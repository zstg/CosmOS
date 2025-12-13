{pkgs, lib,...}: {
  home-manager.users.nixos.home = {
    packages = [ pkgs.nwg-dock-hyprland ];
  };
  file.".config/nwg-dock-hyprland" = {
    recursive = true;
    source = lib.fileset.toSource { root = ./.; fileset = ./.;};
  };
}

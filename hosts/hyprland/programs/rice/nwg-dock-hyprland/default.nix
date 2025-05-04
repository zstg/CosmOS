{pkgs, lib,...}: {
  home-manager.users.stig.home = {
    packages = [ pkgs.nwg-dock-hyprland ];
  };
  file.".config/nwg-dock-hyprland" = {
    recursive = true;
    source = lib.fileset.toSource { root = ./.; fileset = ./.;};
  };
}

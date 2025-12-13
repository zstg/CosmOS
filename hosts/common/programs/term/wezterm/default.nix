{pkgs, lib,...}: {
  home-manager.users.nixos.home = {
    packages = [ pkgs.wezterm ];
    file.".config/wezterm" = {
      recursive = true;
      source = lib.fileset.toSource { root = ./.; fileset = ./.; };
    };
  };
}

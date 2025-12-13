{pkgs,lib,...}: {
  home-manager.users.nixos = {
    gtk = {
      enable = true;
    };
  };
}

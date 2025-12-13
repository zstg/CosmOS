{pkgs,...}: {
  home-manager.users.nixos = {
    home.packages = with pkgs; [ bat eza ripgrep ];
  };
}

{pkgs,...}: {
  home-manager.users.stig = {
    home.packages = with pkgs; [ bat eza ripgrep ];
  };
}
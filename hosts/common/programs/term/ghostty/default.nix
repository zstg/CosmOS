{pkgs, ...}: {
  environment.systemPackages = [ pkgs.ghostty ];
  home-manager.users.stig.home = {
    # packages = [ pkgs.ghostty ];
    file.".config/ghostty/config".source = ./config;
  };
}

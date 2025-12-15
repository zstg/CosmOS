{ pkgs, ... }: {
  home-manager.users.nixos.home.packages = with pkgs; [ ripgrep-all ];
}

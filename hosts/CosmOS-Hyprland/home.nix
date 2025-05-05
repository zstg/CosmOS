{ pkgs,... }: {
  home-manager.users.stig.home.packages = with pkgs; [
    cmake gnumake
    zip unzip
    polkit_gnome
    pandoc
    ranger
    zoxide
    python314FreeThreading pyright
    distrobox
    appimage-run
  ];
}

{ pkgs,... }: 
let 
  wallpaper = ./services/desktopmanager/StratOS-Tokyonight-vectorized-caption.png;
in
{
  home-manager.users.stig.home.packages = with pkgs; [ ];

  dconf.settings = {
    "org/gnome/shell" = {
      enabled-extensions = [
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "blur-my-shell@aunetx"
        "dash-to-dock@micxgx@gmail.com"
        "logomenu@aryan_k"
        # "space-bar@luhrioh"
        "app-menu@gnome-shell-extensions.gcampax.github.com"
        "places-menu@gnome-shell-extensions.github.com"
      ];
      favorite-apps = [
        "org.gnome.Terminal.desktop"
        "org.gnome.Nautilus.desktop"
        "org.gnome.Settings.desktop"
        "emacs.desktop"
        "zen-browser.desktop"
      ];
    };

    "org/gnome/desktop/interface" = {
      monospace-font-name = "JetBrainsMonoNF 10";
      color-scheme = "prefer-dark";
      clock-show-weekday = true;
      clock-show-seconds = true;
    };

    "org/gnome/desktop/background" = {
      picture-uri = "file://${wallpaper}";
      picture-uri-dark = "file://${wallpaper}";
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = "close,minimize,maximize:";
    };
  };
}

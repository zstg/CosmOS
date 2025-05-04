{pkgs,...}:
{
    xdg = {
      portal = {
        enable = true;
        extraPortals = with pkgs;[ xdg-desktop-portal-gtk kdePackages.xdg-desktop-portal-kde xdg-desktop-portal-hyprland ];
        config.common.default = ["gtk"];
      };
      mime = {
        enable = true;
        defaultApplications = {
          "x-scheme-handler/http" = "brave-browser.desktop";
          "x-scheme-handler/https" = "brave-browser.desktop";
          "x-scheme-handler/about" = "brave-browser.desktop";
          "x-scheme-handler/unknown" = "brave-browser.desktop";
          "application/pdf" = "brave-browser.desktop";
          "image/jpg" = "swappy.desktop";
          "image/png" = "swappy.desktop";
          "image/gif" = "brave-browser.desktop";
        };
      };
    };
}

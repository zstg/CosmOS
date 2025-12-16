{pkgs, lib, ...}: {
  imports = [ ../common ];
  services.displayManager.cosmic-greeter.enable = false;
  services.desktopManager.cosmic = {
    enable = true;
    xwayland.enable = true;
    showExcludedPkgsWarning = false;
  };
  environment.cosmic.excludePackages = with pkgs; [
    cosmic-term
    cosmic-edit
    cosmic-store
    cosmic-randr
    cosmic-reader
    # cosmic-player
    # cosmic-greeter # this is required for the lock screen
    cosmic-ext-ctl
    cosmic-files
    kdePackages.xwaylandvideobridge
  ];

  home-manager.users.nixos.home = {
    activation.cleanupCosmic = lib.mkBefore ''
      rm -rf ~/.config/cosmic
    '';
    activation.configureCosmic = lib.mkAfter ''
      ln -sf ~/.nixos/hosts/Krypton/services/desktopmanager/cosmic/ ~/.config/
    '';
  };
}

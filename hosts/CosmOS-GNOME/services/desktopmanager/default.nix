{ config, pkgs, ... }: {
  services.xserver = {
    desktopManager.gnome = {
      enable = true;
      # Disable non-essential GNOME components
      extraGSettingsOverrides = ''
        [org.gnome.desktop.interface]
        enable-hot-corners=false
      '';
    };
    # Disable non-essential X11 services
    xkb.layout = "us";
    xkb.options = "terminate:ctrl_alt_bksp";
  };
  services.libinput.enable = true;  # Touchpad support
  # Disable GNOME services we don't need
  services.gnome = {
    # Disable tracker (file indexing)
    localsearch.enable = false;
    tinysparql.enable = false;
  };

  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    # Disable extra features
    jack.enable = false;
  };

  # Disable printing service
  services.printing.enable = false;

  # Disable Bluetooth if not needed
  hardware.bluetooth.enable = false;

  environment.systemPackages = with pkgs; [
    gnome-terminal
    nautilus
    gedit
    gnome-tweaks
    gnome-shell-extensions
    # Utilities
    wget
    git
    htop

    # Gnome Extensions
    gnomeExtensions.blur-my-shell
    gnomeExtensions.burn-my-windows
    gnomeExtensions.dock-from-dash
    gnomeExtensions.forge
    gnomeExtensions.logo-menu
    gnomeExtensions.space-bar
    gnomeExtensions.user-themes
    gnomeExtensions.user-themes-x
  ];
}
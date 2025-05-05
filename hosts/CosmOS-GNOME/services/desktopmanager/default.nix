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
    layout = "us";
    xkbOptions = "terminate:ctrl_alt_bksp";
    libinput.enable = true;  # Touchpad support
  };

  # Disable GNOME services we don't need
  services.gnome = {
    # Disable tracker (file indexing)
    tracker-miners.enable = false;
    tracker.enable = false;
    # Disable GNOME Software/packagekit
    gnome-software.enable = false;
  };

  # Sound - minimal PipeWire setup
  sound.enable = true;
  hardware.pulseaudio.enable = false;
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
    gnome.gnome-terminal
    gnome.nautilus
    gnome.gedit
    gnome.gnome-tweaks
    gnome.gnome-shell-extensions
    # Utilities
    wget
    git
    htop
  ];

  environment.systemPackages = with pkgs.gnomeExtensions; [
    blur-my-shell
    burn-my-windows
    dock-from-dash
    forge
    logomenu
    space-bar
  ];
}
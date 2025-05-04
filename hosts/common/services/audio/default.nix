{...}: {
  hardware = {
    bluetooth.enable = true;
  };
  services = {
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      pulse.enable = true;
      # use the example session manager (no others are packaged yet so this is enabled by default.
      # no need to redefine it in your config for now)
      # media-session.enable = true;
      wireplumber.enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
    };
  };
}

{ pkgs, config, ... }: 
let
  globals = config._module.args.globals;
in
{
  home-manager.users.${globals.nixos_user} = { pkgs, ...}: {
    home.sessionVariables = {
      # See https://docs.vicinae.com/caveats#platform-specific-caveats
      COSMIC_DATA_CONTROL_ENABLED=1;
      USE_LAYER_SHELL=0;
    };
    services.vicinae = {
      enable = true;
      package = pkgs.vicinae; # merged into nixpkgs-unstable
      autoStart = true;
      settings = {
        closeonFocusLoss = true;
        faviconService = "twenty";
        font = {
          normal = "JetBrainsMono Nerd Font";
          size = 14;
        };
        keybinding = "default";
        popToRootOnClose = true;
        rootSearch = {
          searchFiles = true;
        };
        theme = {
          # name = "catppuccin-macchiato";
          # name = "tokyo-night"; # stylix is the default
        };
        window = {
          csd = true;
          opacity = pkgs.lib.mkForce 0.80;
          rounding = 10;
        };
      };
    };
  };
}

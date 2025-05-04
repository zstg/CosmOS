{...}: {
  security = {
  wrappers.sudo.setuid = true;
   /*
    sudo = {
      extraConfig = ''
        Defaults Insults
      '';
    };
    */
    polkit = {
      enable = true;
    };
    rtkit.enable = true;
  };
}

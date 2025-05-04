{ config, pkgs, home-manager,... }: {
  home-manager.users.stig = {
    programs.gpg.enable = true;
    services.gpg-agent = {
      enable = true;
      enableSshSupport = true;
      enableExtraSocket = true;
      defaultCacheTtl = 4294967295;
      defaultCacheTtlSsh = 4294967295;
      pinentry.package = pkgs.pinentry-qt;
    };
  };
}

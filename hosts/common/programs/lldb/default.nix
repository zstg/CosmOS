{home-manager,pkgs, lib,...}: {
  home-manager.users.stig.home = {
    packages = with pkgs; [ lldb clang clang-tools ];
    file.".lldbinit" = {
      source = ./.lldbinit;
    };
  };
}

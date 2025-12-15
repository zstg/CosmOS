{pkgs, lib,...}: {
  home-manager.users.nixos.home = {
    packages = with pkgs; [ lldb clang clang-tools ];
    file.".lldbinit" = {
      source = ./.lldbinit;
    };
  };
}

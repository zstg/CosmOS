{pkgs, ...}: {
  home-manager.users.nixos.home = {
    packages = with pkgs; [ gdb gcc clang-tools ];
    file.".gdbinit" = {
      source = ./.gdbinit;
    };
  };
}

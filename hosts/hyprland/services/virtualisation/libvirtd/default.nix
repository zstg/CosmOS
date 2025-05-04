{pkgs,...}: {
  virtualisation = {
    libvirtd = {
      enable = true;
      onShutdown = "shutdown";
      onBoot = "ignore";
      qemu = {
        package = pkgs.qemu_kvm;
        # swtpm.enable = true; # reqd only for Windows
        ovmf.enable = true;
        ovmf.packages = [pkgs.OVMFFull.fd];
      };
    };
  };
}

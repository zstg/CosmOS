{
  disko.devices = {
    disk = {
      sda = {
        device = "/dev/sda"; # SSD
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            boot = {
              type = "EF00";  # EFI System Partition
              size = "1023M";  # 1MB to 1024MB (1MB reserved for alignment)
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };
            root = { # should this be nixos instead?
              size = "100%";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
              };
            };
          };
        };
      };
      sdb = {
        device = "/dev/sdb"; # the HDD
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            home = {
              size = "100%";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/home";
              };
            };
          };
        };
      };
    };
  };
}

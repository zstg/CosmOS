# Source: https://github.com/nix-community/disko-templates/blob/main/single-disk-ext4/disko-config.nix
# USE: sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount /path/to/disko-config.nix
# NOTE it's a good idea to enable flakes: https://gist.githubusercontent.com/zstg/34b670213ceec874904cadd13194c626/raw/ce5eb3b27e5d8304aaab01eb0bf27433b18dbe9c/flakes_nix.sh
# USAGE in your configuration.nix.
# Update devices to match your hardware.
# {
#  imports = [ ./disko-config.nix ];
#  disko.devices.disk.main.device = "/dev/sda";
# }
{
  disko.devices = {
    disk = {
      main = {
        device = "/dev/vda";
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            boot = {
              size = "1M";
              type = "EF02"; # for grub MBR
            };
            ESP = {
              size = "1G";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };
            root = {
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
    };
  };
}

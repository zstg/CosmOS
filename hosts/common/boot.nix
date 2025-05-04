{pkgs, lib, ...}: {
  boot = {
    # kernelPackages = pkgs.linuxPackages_latest;
    # supportedFilesystems = lib.mkForce [ "ext4" "vfat" "ntfs" "btrfs" ];
    # supportedFilesystems.zfs = lib.mkForce false;
    kernelParams = [ "fsck.mode=skip" "quiet" "loglevel=3"];
    # kernelModules = [ "uinput" ];
    initrd = {
	    checkJournalingFS = false;
	    /*
	    services.udev.rules.extraRules = ''
  		  SUBSYSTEM=="input", GROUP="uinput"
  		  KERNEL=="uinput", GROUP="uinput"
	    '';
	    */
    };
    tmp.cleanOnBoot = true;
    loader = {
      systemd-boot.enable = true;
      timeout = lib.mkForce 1; # the ISO won't build otherwise
    };
    binfmt.registrations.appimage = {
      wrapInterpreterInShell = false;
      interpreter = "${pkgs.appimage-run}/bin/appimage-run";
      recognitionType = "magic";
      offset = 0;
      mask = ''\xff\xff\xff\xff\x00\x00\x00\x00\xff\xff\xff'';
      magicOrExtension = ''\x7fELF....AI\x02'';
    };
  };
}

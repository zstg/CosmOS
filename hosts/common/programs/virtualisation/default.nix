{pkgs,home-manager, ...}: {
  imports = [ 
	# ./docker
	# ./podman
	# ./libvirtd
  ];
  home-manager.users.stig = {
    home.packages = [
      # pkgs.virt-manager
      # pkgs.gnome-boxes
    ];
  };
}

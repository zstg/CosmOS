{pkgs, config,...}: {
	boot.plymouth = {
		enable = true;
		themePackages = [ pkgs.adi1090x-plymouth-themes ];
		theme = "red_loader";	
	};
}

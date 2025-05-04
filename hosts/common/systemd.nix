{lib,...}:{
	services.journald.extraConfig = "SsytemMaxUse=5M";
	systemd.services.NetworkManager-wait-online.wantedBy = lib.mkForce [];
}

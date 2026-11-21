{ config, pkgs, ... }:

{
	networking = {
		hostName = "nixos";
		# wireless.enable = true;
		networkmanager.enable = true;
		enableIPv6 = false;
	};

	# MT7922 drops with 4-way handshake timeouts when PCIe ASPM is active.
	boot.extraModprobeConfig = "options mt7921e disable_aspm=1";
}

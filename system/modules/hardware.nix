{ config, pkgs, ... }: 

{
	hardware = {
# Bluetooth support
		bluetooth.enable = true;

    # Graphics (generic settings, NVIDIA-specific in machine-asus-amd-nvidia.nix)
		graphics = {
			enable = true;
			enable32Bit = true;
		};
	};
}

# Legion

Configuration for the Lenovo Legion laptop, under `system/configurations/legion/`. This machine has an AMD iGPU and an NVIDIA dGPU (hybrid graphics), which requires different driver modes depending on whether the laptop is plugged in or on battery.

## Entry point

<<< @/../system/configurations/legion/default.nix

## Hardware configuration

<<< @/../system/configurations/legion/hardware-configuration.nix

Key differences from the desktop:

- **Initramfs modules**: `nvme`, `xhci_pci`, `usbhid`, `rtsx_pci_sdmmc` (SD card reader)
- **KVM**: `kvm-amd` module loaded for virtualisation support
- **Boot**: stricter EFI permissions (`fmask=0077`, `dmask=0077`)

## Base hardware module (GPU)

<<< @/../system/configurations/legion/modules/hardware.nix

Both `amdgpu` and `nvidia` drivers are loaded. The `nvidia.prime` block declares the PCIe bus IDs for both GPUs — required for PRIME offload and sync to work correctly.

| Option | Value |
|--------|-------|
| `nvidia.open` | `true` — uses the open-source NVIDIA kernel module |
| `nvidia.modesetting.enable` | `true` — required for Wayland |
| `nvidia.powerManagement.enable` | `true` — enables NVIDIA runtime power management |
| `amdgpuBusId` | `PCI:6@0:0:0` |
| `nvidiaBusId` | `PCI:1@0:0:0` |

## Specialisations

NixOS specialisations allow building multiple system variants from a single configuration, all available as separate GRUB entries. The Legion uses two specialisations to switch GPU modes at boot:

<<< @/../system/configurations/legion/specialisations/default.nix

### legion-docked

Used when the laptop is connected to an external monitor or power source and full GPU performance is needed.

<<< @/../system/configurations/legion/specialisations/docked/modules/hardware.nix

`nvidia.prime.sync.enable = true` activates PRIME Sync mode: both GPUs are active simultaneously. All rendering goes through the NVIDIA GPU and is composited by the AMD iGPU. This delivers maximum performance but higher power consumption.

### legion-on-the-go

Used on battery for portability and longer runtime.

<<< @/../system/configurations/legion/specialisations/on-the-go/modules/hardware.nix

`nvidia.prime.offload` activates PRIME offload mode: only the AMD iGPU renders by default. The NVIDIA GPU powers on only when explicitly requested with the `nvidia-offload` wrapper command. This maximises battery life.

## GRUB entry renaming

Specialisation GRUB entries are generated with long auto-generated names by NixOS. An activation script renames them to friendlier labels:

<<< @/../system/configurations/legion/modules/activation-scripts.nix

The `sed` commands rename entries matching `legion-docked` and `legion-on-the-go` patterns to `"NixOS - Legion Docked"` and `"NixOS - Legion On The Go"` respectively. This runs every time the system is rebuilt.

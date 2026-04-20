# Hardware

Base hardware settings shared across all machines, in `system/modules/hardware.nix`.

<<< @/../system/modules/hardware.nix

## Bluetooth

Enables the BlueZ stack and kernel Bluetooth drivers. Use `blueberry` (available in Home Manager packages) for a GUI Bluetooth manager.

## Graphics

`hardware.graphics.enable = true` installs GPU drivers and OpenGL/Vulkan libraries. `enable32Bit = true` adds the 32-bit variants required by Steam and Wine.

::: info
Machine-specific GPU drivers (AMD, NVIDIA hybrid) are configured per-device under `system/configurations/`. This base module only enables the common graphics subsystem.
:::

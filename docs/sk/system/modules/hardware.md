# Hardware

Základné hardvérové nastavenia zdieľané pre všetky stroje, v `system/modules/hardware.nix`.

<<< @/../system/modules/hardware.nix

## Bluetooth

Povolí BlueZ stack a ovládače Bluetooth jadra. Pre GUI správcu Bluetooth použij `blueberry` (dostupný v Home Manager balíčkoch).

## Grafika

`hardware.graphics.enable = true` inštaluje GPU ovládače a OpenGL/Vulkan knižnice. `enable32Bit = true` pridáva 32-bitové varianty potrebné pre Steam a Wine.

::: info
Špecifické GPU ovládače (AMD, NVIDIA hybrid) sú nakonfigurované per-zariadenie v `system/configurations/`. Tento základný modul len povolí spoločný grafický subsystém.
:::

# Sound

Audio stack configuration in `system/modules/sound.nix`.

<<< @/../system/modules/sound.nix

## PipeWire

PipeWire replaces both PulseAudio and JACK. It is the recommended audio stack for NixOS on Wayland desktops.

| Component | Purpose |
|-----------|---------|
| `pipewire` | Core daemon — routes audio between applications and hardware |
| `alsa` + `alsa.support32Bit` | ALSA compatibility layer — lets ALSA-native apps work through PipeWire; 32-bit needed for Steam/Wine |
| `pulse` | PulseAudio compatibility — applications using the PulseAudio API work without changes |
| `jack` | JACK compatibility — low-latency audio routing for production tools |
| `wireplumber` | Session and policy manager — handles device routing, permissions, and dynamic device connections |

`security.rtkit.enable = true` allows PipeWire to request real-time scheduling priority for low-latency audio, without running as root.

`services.pulseaudio.enable = false` explicitly disables PulseAudio to prevent conflicts.

`pamixer` and `pavucontrol` are installed for volume control (CLI and GUI respectively).

::: tip
[All services.pipewire options](https://search.nixos.org/options?channel=25.05&query=services.pipewire)
:::

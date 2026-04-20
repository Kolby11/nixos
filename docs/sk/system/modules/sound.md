# Zvuk

Konfigurácia audio stacku v `system/modules/sound.nix`.

<<< @/../system/modules/sound.nix

## PipeWire

PipeWire nahrádza PulseAudio a JACK. Je odporúčaný audio stack pre NixOS na Wayland desktopoch.

|                    Komponent |                                                                                                          Účel |
| ---------------------------: | ------------------------------------------------------------------------------------------------------------: |
|                   `pipewire` |                                                    Jadro démona — smeruje audio medzi aplikáciami a hardvérom |
| `alsa` + `alsa.support32Bit` | ALSA kompatibilita — umožní ALSA natívnym aplikáciám fungovať cez PipeWire; 32-bit je potrebný pre Steam/Wine |
|                      `pulse` |                             PulseAudio kompatibilita — aplikácie používajúce PulseAudio API fungujú bez zmien |
|                       `jack` |                                          JACK kompatibilita — nízkolatenčné routovanie pre produkčné nástroje |
|                `wireplumber` |                      Manažér relácií a politiky — spravuje routovanie zariadení, práva a dynamické pripojenia |

`security.rtkit.enable = true` umožňuje PipeWire požiadať o real-time scheduling priority pre nízku latenciu bez spúšťania ako root.

`services.pulseaudio.enable = false` explicitne zakazuje PulseAudio, aby sa predišlo konfliktom.

`pamixer` a `pavucontrol` sú nainštalované pre ovládanie hlasitosti (CLI a GUI).

::: tip
[All services.pipewire options](https://search.nixos.org/options?channel=25.05&query=services.pipewire)
:::

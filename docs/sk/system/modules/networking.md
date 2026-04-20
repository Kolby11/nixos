# Sieť

Sieťová konfigurácia v `system/modules/networking.nix`.

<<< @/../system/modules/networking.nix

## NetworkManager

NetworkManager spravuje všetky káblové aj bezdrôtové pripojenia. IPv6 je vypnuté (`enableIPv6 = false`).

Hostname `"nixos"` je spoločné predvolené. Môžeš ho prepísať per-zariadenie v `system/configurations/<zariadenie>/`.

::: tip
[Všetky možnosti networking](https://search.nixos.org/options?channel=25.05&query=networking)
:::

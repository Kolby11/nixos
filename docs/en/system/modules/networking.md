# Networking

Network configuration in `system/modules/networking.nix`.

<<< @/../system/modules/networking.nix

## NetworkManager

NetworkManager manages all wired and wireless connections. It integrates with desktop network applets and supports VPNs, mobile broadband, and connection profiles.

`enableIPv6 = false` disables IPv6 system-wide.

The hostname `"nixos"` is the shared default. Override it per device in `system/configurations/<device>/` if needed.

::: tip
[All networking options](https://search.nixos.org/options?channel=25.05&query=networking)
:::

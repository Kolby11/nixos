# Users

User account definitions in `system/modules/users.nix`.

<<< @/../system/modules/users.nix

## Accounts

Two normal user accounts are defined:

| User | Groups | Purpose |
|------|--------|---------|
| `kolby` | `wheel`, `networkmanager` | Primary user, runs Home Manager |
| `mato` | `wheel`, `networkmanager` | Secondary user account |

Both accounts are in the `wheel` group, granting `sudo` access. The `networkmanager` group allows managing network connections without `sudo`.

::: info
Passwords are not declared in the Nix config. Set them with `passwd <username>` after the first rebuild. NixOS stores hashed passwords in `/etc/shadow`, which is stateful.
:::

::: tip
[All users.users options](https://search.nixos.org/options?channel=25.05&query=users.users)
:::

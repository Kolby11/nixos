# Remote Desktop

Two remote desktop solutions are available under `system/modules/remote-desktop/`. Both are **currently disabled** in `default.nix`:

<<< @/../system/modules/remote-desktop/default.nix

Uncomment either import to enable it.

## RustDesk (self-hosted)

`rustdesk.nix` sets up a full self-hosted RustDesk server (signal + relay) alongside the client.

<<< @/../system/modules/remote-desktop/rustdesk.nix

Key points:

- Opens firewall ports `21115–21119` TCP and `21116` UDP
- Two systemd services: `rustdesksignal` (hbbs) and `rustdeskrelay` (hbbr) start on boot and are linked as peers — stopping one stops both
- Logs written to `/var/log/rustdesk/`
- `-k _` disables key verification (suitable for a private LAN)
- Persistent data (SQLite DB, key pair) can be symlinked to a persistent volume via `systemd.tmpfiles.rules` for setups that erase `/opt` on boot

## WayVNC

`wayvnc.nix` runs a VNC server on a Wayland session as a systemd user service.

<<< @/../system/modules/remote-desktop/wayvnc.nix

Adjust `WAYLAND_DISPLAY` and `XDG_RUNTIME_DIR` to match your user ID and display socket if they differ from the defaults.

# Vzdialená plocha

Sú dostupné dve riešenia vzdialenej plochy v `system/modules/remote-desktop/`. Obe sú **aktuálne zakomentované** v `default.nix`:

<<< @/../system/modules/remote-desktop/default.nix

Odkážte (uncomment) príslušný import na jeho povolenie.

## RustDesk (self-hosted)

`rustdesk.nix` nastaví samohostovaný RustDesk server (signal + relay) spolu s klientom.

<<< @/../system/modules/remote-desktop/rustdesk.nix

Kľúčové body:

- Otvorí firewall porty `21115–21119` TCP a `21116` UDP
- Dva systemd servisné jednotky: `rustdesksignal` (hbbs) a `rustdeskrelay` (hbbr) sa spustia pri štarte a sú previazané — zastavenie jedného zastaví aj druhý
- Logy sa zapisujú do `/var/log/rustdesk/`
- `-k _` vypne overovanie kľúčov (vhodné pre súkromnú LAN)
- Perzistentné dáta (SQLite DB, kľúčový pár) možno symlinkovať na perzistentné úložisko cez `systemd.tmpfiles.rules`

## WayVNC

`wayvnc.nix` spúšťa VNC server na Wayland relácii ako systemd user service.

<<< @/../system/modules/remote-desktop/wayvnc.nix

Nastavte `WAYLAND_DISPLAY` a `XDG_RUNTIME_DIR`, ak sa odlišujú od predvolených hodnôt.

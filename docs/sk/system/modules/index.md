# Systémové moduly

Všetka zdieľaná systémová konfigurácia sa nachádza v `system/modules/`. Každý modul je importovaný cez `system/modules/default.nix`:

<<< @/../system/modules/default.nix

## Prehľad modulov

| Modul | Účel |
|-------|------|
| `boot.nix` | GRUB bootloader a Plymouth splash screen |
| `gaming.nix` | Pridáva nix-gaming binárnu cache pre herné balíčky |
| `hardware.nix` | Základná hardvérová podpora: Bluetooth, grafika (32-bit) |
| `i18n.nix` | Systémové locale a podporované jazyky |
| `networking.nix` | NetworkManager, hostname, IPv6 |
| `nixsettings.nix` | Nastavenia Nix démona, flakes, garbage collection |
| `packages.nix` | Základné systémové balíčky dostupné všetkým používateľom |
| `polkit.nix` | GNOME Polkit autentifikačný agent ako systemd user service |
| `programs.nix` | direnv, nix-ld, fish, GnuPG, XDG portál |
| `remote-desktop/` | RustDesk a WayVNC (obidva momentálne vypnuté) |
| `security.nix` | Polkit enable, PAM odomknutie kľúčenky |
| `services.nix` | SDDM správca zobrazenia a podporné služby |
| `sound.nix` | PipeWire audio stack |
| `theme/` | SDDM greenleaf vizuálna téma |
| `time.nix` | Systémová časová zóna |
| `users.nix` | Definície používateľských účtov |

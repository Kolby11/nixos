# Polkit

Polkit autentifikačný agent je nakonfigurovaný v `system/modules/polkit.nix`.

<<< @/../system/modules/polkit.nix

## GNOME Polkit agent

`polkit-gnome-authentication-agent-1` beží ako systemd user service spustený s grafickou reláciou. Keď nejaký proces požiada o zvýšené oprávnenia cez Polkit — napr. pripojenie disku, inštalácia systémového balíčka z GUI alebo zmena sieťových nastavení — tento agent zobrazí dialóg pre zadanie hesla.

Služba:
- Štartuje **po** `graphical-session.target`, takže je aktívna len vtedy, keď beží grafická relácia
- Automaticky sa reštartuje pri chybe s oneskorením 1 sekunda
- Zastaví sa do 10 sekúnd pri odhlásení relácie (`TimeoutStopSec = 10`)

::: info
`security.polkit.enable = true` je nastavené v `security.nix`. Tento modul poskytuje iba grafického agenta, ktorý odpovedá na Polkit autorizácie.
:::

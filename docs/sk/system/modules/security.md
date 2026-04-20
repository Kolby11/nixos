# Bezpečnosť

Bezpečnostná konfigurácia v `system/modules/security.nix`.

<<< @/../system/modules/security.nix

## Polkit

`security.polkit.enable = true` načíta Polkit autorizačný framework. Aplikácie použijú Polkit na žiadanie zvýšených oprávnení bez spúšťania ako root. Grafický dialóg pre heslo poskytuje [Polkit agent](/system/modules/polkit).

## GNOME Keyring cez PAM

`pam.services.sddm.enableGnomeKeyring = true` konfiguruje SDDM PAM stack tak, aby sa GNOME Keyring automaticky odomkol pri prihlásení. Aplikácie používajúce `libsecret` (úložiská hesiel v prehliadačoch, SSH agenty atď.) tak získajú prístup k uloženým tajomstvám hneď po prihlásení.

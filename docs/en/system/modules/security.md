# Security

Security configuration in `system/modules/security.nix`.

<<< @/../system/modules/security.nix

## Polkit

`security.polkit.enable = true` loads the Polkit authorization framework. Applications use Polkit to request elevated privileges without running as root. The graphical password dialog is provided by the [Polkit agent](/system/modules/polkit).

## GNOME Keyring via PAM

`pam.services.sddm.enableGnomeKeyring = true` configures SDDM's PAM stack to automatically unlock the GNOME Keyring at login. Applications using `libsecret` (browser credential stores, SSH agents, etc.) can then access their stored secrets immediately after login without a separate keyring unlock prompt.

# Polkit

Polkit authentication agent configured in `system/modules/polkit.nix`.

<<< @/../system/modules/polkit.nix

## GNOME Polkit agent

`polkit-gnome-authentication-agent-1` runs as a systemd user service started with the graphical session. When any process requests elevated privileges through Polkit — for example, mounting a disk, installing a system package from a GUI, or modifying network connections — this agent displays a password dialog.

The service:
- Starts **after** `graphical-session.target` so it is only active when a desktop session is running
- Restarts automatically on failure with a 1-second backoff
- Stops within 10 seconds on session logout (`TimeoutStopSec = 10`)

::: info
`security.polkit.enable = true` is set in `security.nix`. This module only provides the graphical agent that responds to Polkit authorization requests.
:::

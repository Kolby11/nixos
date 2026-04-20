# Time

Timezone configuration in `system/modules/time.nix`.

<<< @/../system/modules/time.nix

The system timezone is set to `Europe/Bratislava` (Central European Time, UTC+1 / UTC+2 in summer). NixOS uses the system timezone for the hardware clock and all system services.

::: tip
Find your timezone identifier at [Wikipedia — List of tz database time zones](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) or run `timedatectl list-timezones`.
:::

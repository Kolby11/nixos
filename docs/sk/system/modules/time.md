# Čas

Konfigurácia časového pásma v `system/modules/time.nix`.

<<< @/../system/modules/time.nix

Systémové časové pásmo je nastavené na `Europe/Bratislava` (Stredoeurópsky čas, UTC+1 / UTC+2 v lete). NixOS používa systémové časové pásmo pre hardware clock a všetky systémové služby.

::: tip
Nájdete svoj identifikátor časového pásma na [Wikipedia — List of tz database time zones](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) alebo spustením `timedatectl list-timezones`.
:::

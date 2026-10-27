{ lib, device, ... }:
{
  imports = [ ./features.nix ] ++
    lib.optionals (device == "desktop") [ ./desktop ] ++
    lib.optionals (device == "legion") [ ./legion ] ++
    lib.optionals (device == "hp") [ ./hp ];
}

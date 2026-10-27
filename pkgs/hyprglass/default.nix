{ lib, fetchFromGitHub, hyprlandPlugins, hyprland, wayland-scanner }:

hyprlandPlugins.mkHyprlandPlugin {
  pluginName = "hyprglass";
  version = "0-unstable-2026-10-27";
  inherit hyprland;

  # Pin the compatibility branch for Hyprland 0.56, rather than main.
  src = fetchFromGitHub {
    owner = "hyprnux";
    repo = "hyprglass";
    rev = "7fc328064c63d9fbaaac8d8204eadf85dcdeae19";
    hash = "sha256-SOdn2s/oxf5v2VYHVmQvfvRIyyV9kFNvEBpQXkLCb+s=";
  };

  nativeBuildInputs = [ wayland-scanner ];
  enableParallelBuilding = true;
  makeFlags = [ "HYPRGLASS_VERSION=7fc3280" ];

  installPhase = ''
    runHook preInstall
    install -Dm755 hyprglass.so $out/lib/hyprglass.so
    runHook postInstall
  '';

  meta = {
    description = "Liquid Glass inspired plugin for Hyprland";
    homepage = "https://github.com/hyprnux/hyprglass";
    license = lib.licenses.bsd3;
    platforms = lib.platforms.linux;
  };
}

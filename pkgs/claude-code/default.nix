{
  lib,
  stdenv,
  fetchzip,
  makeWrapper,
  bubblewrap,
  procps,
  socat,
}:

let
  version = "2.1.170";

  sources = {
    x86_64-linux = fetchzip {
      url = "https://registry.npmjs.org/@anthropic-ai/claude-code-linux-x64/-/claude-code-linux-x64-${version}.tgz";
      hash = "sha256-RtALw+0GbGldqwiLjGiIRFCrDJ47mnIU+nFsPTG9xsw=";
      stripRoot = false;
    };
    aarch64-linux = fetchzip {
      url = "https://registry.npmjs.org/@anthropic-ai/claude-code-linux-arm64/-/claude-code-linux-arm64-${version}.tgz";
      hash = lib.fakeHash;
      stripRoot = false;
    };
  };

  src = sources.${stdenv.hostPlatform.system} or (throw "Unsupported platform: ${stdenv.hostPlatform.system}");
in
stdenv.mkDerivation {
  pname = "claude-code";
  inherit version src;

  nativeBuildInputs = [ makeWrapper ];

  dontUnpack = true;
  dontBuild = true;
  dontPatchELF = true;
  dontStrip = true;

  installPhase = ''
    mkdir -p $out/bin
    # Reference the binary directly from the source store — do NOT copy+patch it.
    # patchelf corrupts bun SEA binaries by moving ELF sections and destroying
    # the embedded JS payload. The unpatched binary works via the /lib64 compat link.
    makeWrapper ${src}/package/claude $out/bin/claude \
      --argv0 claude \
      --set DISABLE_AUTOUPDATER 1 \
      --set DISABLE_INSTALLATION_CHECKS 1 \
      --set-default FORCE_AUTOUPDATE_PLUGINS 1 \
      --unset DEV \
      --prefix PATH : ${lib.makeBinPath [ procps bubblewrap socat ]}
  '';

  meta = {
    description = "Agentic coding tool that lives in your terminal, understands your codebase, and helps you code faster";
    homepage = "https://github.com/anthropics/claude-code";
    license = lib.licenses.unfree;
    mainProgram = "claude";
    platforms = [ "x86_64-linux" "aarch64-linux" ];
    sourceProvenance = with lib.sourceTypes; [ binaryBytecode ];
  };
}

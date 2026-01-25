{ lib
, stdenv
, fetchFromGitHub
, makeWrapper  
, quickjs
}:

stdenv.mkDerivation rec {
  pname = "wallrizz";
  version = "unstable";

  src = fetchFromGitHub {
    owner = "5hubham5ingh";
    repo = "WallRizz";
    rev = "main";
    hash = "sha256-/pPWT2qO062ir3/t6pN1uBODqsHNmsBqcWGlb64XemE=";
  };

  qjsExtLib = fetchFromGitHub {
    owner = "ctn-malone";
    repo = "qjs-ext-lib";
    rev = "0.12.4";
    hash = "sha256-EWQCF8jPN/V9otHJt+SErMxl7CYZ4TNwcismccwz3NE=";
  };

  justjs = fetchFromGitHub {
    owner = "5hubham5ingh";
    repo = "justjs";
    rev = "main";
    hash = "sha256-FWIS6f16wIvTgpEUxhCeYL94Jp8b19X4Nx6oww7sbU0=";
  };

  nativeBuildInputs = [ makeWrapper ];
  buildInputs = [ quickjs ];

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    
    mkdir -p $out/share
    
    # Debug: Show what we're copying FROM
    echo "=== Source paths ==="
    echo "qjsExtLib: ${qjsExtLib}"
    echo "justjs: ${justjs}"  
    echo "src: ${src}"
    
    echo "=== qjsExtLib contents BEFORE copy ==="
    ls -la ${qjsExtLib}/ || true
    ls -la ${qjsExtLib}/src/ || true
    
    echo "=== justjs contents BEFORE copy ==="
    ls -la ${justjs}/ || true
    
    # Copy with explicit paths
    cp -r ${qjsExtLib} $out/share/qjs-ext-lib
    chmod -R u+w $out/share/qjs-ext-lib
    
    cp -r ${justjs} $out/share/justjs
    chmod -R u+w $out/share/justjs
    
    cp -r ${src} $out/share/WallRizz
    chmod -R u+w $out/share/WallRizz
    
    echo "=== After copy - qjs-ext-lib ==="
    ls -la $out/share/qjs-ext-lib/
    ls -la $out/share/qjs-ext-lib/src/ || echo "NO SRC DIR"
    
    # Create wrapper
    mkdir -p $out/bin
    makeWrapper ${quickjs}/bin/qjs $out/bin/WallRizz \
      --add-flags "-m" \
      --add-flags "$out/share/WallRizz/src/main.js" \
      --chdir "$out/share/WallRizz/src"
    
    runHook postInstall
  '';

  meta = with lib; {
    description = "Wallpaper manager for Linux";
    homepage = "https://github.com/5hubham5ingh/WallRizz";
    license = licenses.mit;
    platforms = platforms.linux;
  };
}
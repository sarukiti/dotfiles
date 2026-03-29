{
  lib,
  stdenvNoCC,
  fetchurl,
  unzip,
}:

stdenvNoCC.mkDerivation rec {
  pname = "cmd-eikana";
  version = "2.4.2";

  src = fetchurl {
    url = "https://github.com/dominion525/cmd-eikana/releases/download/v${version}/cmd-eikana-v${version}-arm64.zip";
    hash = "sha256-Mwc5aIrO7YlA1r79brKipAznOotuOk12UnHWKZhbRiM=";
  };

  nativeBuildInputs = [ unzip ];

  dontUnpack = true;

  installPhase = ''
    runHook preInstall
    mkdir -p "$out/Applications"
    unzip -q "$src" -d "$out/Applications"
    runHook postInstall
  '';

  meta = with lib; {
    description = "⌘英かな — 左右コマンドキー単体で英数/かなを切り替え（Apple Silicon 向けフォーク）";
    homepage = "https://github.com/dominion525/cmd-eikana";
    license = licenses.mit;
    platforms = [ "aarch64-darwin" ];
    sourceProvenance = with sourceTypes; [ binaryNativeCode ];
  };
}

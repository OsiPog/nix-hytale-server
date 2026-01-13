{
  fetchzip,
  stdenv,
  lib,
  ...
}:
stdenv.mkDerivation {
  name = "hytale-downloader";

  src = fetchzip {
    url = "https://downloader.hytale.com/hytale-downloader.zip";
    hash = builtins.readFile ./hash.txt;
    stripRoot = false;
  };

  installPhase = ''
    mkdir -p $out/bin
    cp hytale-downloader-linux-amd64 $out/bin/hytale-downloader
  '';

  meta = {
    platforms = ["x86_64-linux"];
    mainProgram = "hytale-downloader";
  };
}

{ stdenvNoCC, fetchFromGitHub, ... }:
stdenvNoCC.mkDerivation {
  pname = "otf-pingfang";
  version = "20240813";

  src = fetchFromGitHub {
    owner = "jimmyctk";
    repo = "PingFang-OTF-Fonts";
    rev = "b64166348f1248fd72ad1504c817af202cbfc1dd";
    hash = "sha256-DeZT802/7y939XT+upaFmEGlp6+vIgCpKbo12HEiGKc=";
  };

  installPhase = ''
    runHook preInstall

    install -Dm644 ./OTF/*.otf -t $out/share/fonts/opentype/PingFangSC

    runHook postInstall
  '';
}

{ stdenvNoCC, fetchFromGitHub, ... }:
stdenvNoCC.mkDerivation {
  pname = "otf-sf-pro";
  version = "20240813.01";

  src = fetchFromGitHub {
    owner = "sahibjotsaggu";
    repo = "San-Francisco-Pro-Fonts";
    rev = "8bfea09aa6f1139479f80358b2e1e5c6dc991a58";
    hash = "";
  };

  installPhase = ''
    runHook preInstall

    install -Dm644 ./*.otf -t $out/share/fonts/opentype/sf-pro

    runHook postInstall
  '';
}

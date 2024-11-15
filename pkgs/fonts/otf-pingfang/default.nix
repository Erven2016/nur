{ stdenvNoCC, fetchFromGitHub, ... }:
stdenvNoCC.mkDerivation {
  pname = "otf-pingfang";
  version = "20241115";

  src = fetchFromGitHub {
    owner = "erven2016";
    repo = "nur";
    rev = "d020ab8b997e2658495eebbc40a2060288ab371f";
    hash = "sha256-hXnXeQARs4UsI/z1oIi+FVtYV1zhvtPASv8AHarQzR8=";
  };

  installPhase = ''
    runHook preInstall

    install -Dm644 ./otf/*.otf -t $out/share/fonts/opentype/PingFang

    runHook postInstall
  '';
}

{
  buildGoModule,
  fetchFromGitHub,
}:
buildGoModule {
  name = "clash2singbox";
  version = "efa112d";

  src = fetchFromGitHub {
    owner = "xmdhs";
    repo = "clash2singbox";
    rev = "efa112d7d5a7ed87db6ed4d5fd6e294b6737ed80";
    hash = "sha256-ht359qipoRH8+QyKtk0wp4UBSq6SwOP64vYlyCxDdNI=";
  };

  vendorHash = "sha256-kjiF6NoZ4b2of2L3phHm5GG2UUG00oi+/mkFTwvyfD4=";
  proxyVendor = true;

  preBuild = ''
    CGO_ENABLED=0
    GOFLAGS="-trimpath"

    export CGO_ENABLED GOFLAGS

  '';

  ldflags = [
    "-w"
    "-s"
  ];

}

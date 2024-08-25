{
  name,
  format,
  hash,
  stdenvNoCC,
  fetchzip,
  ...
}:
let
  inherit name format hash;

  pname = "wallpaper-${name}";
  version = "2024.08.00-01";
in
stdenvNoCC.mkDerivation {
  inherit pname version;
  src = fetchzip {
    # url = "https://github.com/Erven2016/custom-gnome-wallpapers-for-nixos/raw/main/${name}.zip";
    url = "https://github.com/Erven2016/custom-gnome-wallpapers-for-nixos/releases/download/${name}/${name}.zip";
    hash = hash;
    stripRoot = false;
  };

  installPhase = ''
    runHook preInstall
    install -D *.xml -t $out/share/gnome-background-properties
    install -D *.${format} -t $out/share/backgrounds/custom
    runHook postInstall
  '';
}

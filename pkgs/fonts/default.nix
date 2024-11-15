{
  pkgs ? import <nixpkgs> { },
}:
let
  inherit (pkgs) callPackage;
in
{
  otf-pingfang = callPackage ./otf-pingfang { };
}

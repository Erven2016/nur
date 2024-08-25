# This file describes your repository contents.
# It should return a set of nix derivations
# and optionally the special attributes `lib`, `modules` and `overlays`.
# It should NOT import <nixpkgs>. Instead, you should take pkgs as an argument.
# Having pkgs default to <nixpkgs> is fine though, and it lets you use short
# commands such as:
#     nix-build -A mypackage

{
  pkgs ? import <nixpkgs> { },
}:

{
  # The `lib`, `modules`, and `overlays` names are special
  lib = import ./lib { inherit pkgs; }; # functions
  modules = import ./modules; # NixOS modules
  overlays = import ./overlays; # nixpkgs overlays

  imports = [ ./pkgs/wallpaper ];

  # Fonts
  otf-pingfang = pkgs.callPackage ./pkgs/fonts/otf-pingfang { };
  otf-sf-pro = pkgs.callPackage ./pkgs/fonts/otf-sf-pro { };
  "wallpaper-ventura" = pkgs.callPackage ./pkgs/wallpapers/build.nix {
    name = "Ventura";
    format = "png";
    hash = "sha256-d1BtZZm5bRnPGMs3e9k/XpIEa4tGxuqOrg4SA//NQxg=";
  };
}

{ inputs, outputs, lib, config, pkgs, ... }: 

if pkgs.stdenv.isDarwin
then callPackage ./darwin.nix { }
else callPackage ./linux.nix { }

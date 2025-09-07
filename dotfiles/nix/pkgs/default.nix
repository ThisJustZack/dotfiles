{ pkgs ? import <nixpkgs> {}, ...}: rec {
     optcg-sim = pkgs.callPackage ./optcg-sim { };
}

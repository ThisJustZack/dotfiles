{ inputs, ... }:
let
        additions = final: _prev: import ../pkgs final.pkgs;

        modifications = final: prev: {
        };

        unstable-packages = final: _prev: {
                unstable = import inputs.nixpkgs-unstable {
                        inherit (final) system config;
                };
        };

in [
        additions
        modifications
        unstable-packages
]

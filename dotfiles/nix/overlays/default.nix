{ inputs, outputs, nixpkgsConfig ? { }, ... }:
let
        additions = final: _prev: import ../pkgs {pkgs = final;};

        modifications = final: prev: {
        };

        unstable-packages = final: _prev: {
                unstable = import inputs.nixpkgs-unstable {
                        inherit (final) system config;
                        inherit (final.config) nixpkgsConfig;
                };
        };

in [
        additions
        modifications
        unstable-packages
]

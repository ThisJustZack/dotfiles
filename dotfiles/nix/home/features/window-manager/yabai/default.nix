{ inputs, outputs, lib, config, pkgs, ... }: {
        imports = [
                ./yabai
                ./skhd
        ];
}

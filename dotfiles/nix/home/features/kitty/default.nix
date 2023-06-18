{ inputs, outputs, lib, config, pkgs, ... }: {
        programs.kitty = {
                enable = true;
                font = {
                        name = "Fira Code";
                        size = 14;
                };
        };
}

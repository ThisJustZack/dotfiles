{ inputs, outputs, lib, config, pkgs, ... }: {
        programs.zsh = {
                enable = true;
                enableAutosuggestions = true;
                enableCompletion = true;
                enableSyntaxHighlighting = true;
        };
}

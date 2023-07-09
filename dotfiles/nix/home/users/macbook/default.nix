{ inputs, outputs, lib, config, pkgs, ... }: 
let
        user = "zack";
in
{
        imports = [
                <home-manager/nix-darwin>
        ];

        homebrew.formulae = []
                // callPackage ../../features/cli {};

        homebrew.casks = []
                // callPackage ../../features/desktop {};

        home-manager = {
                users.${user} = {
                        home = {
                                packages = with pkgs; []
                                        // callPackage ../../features/lsp {}
                                        // callPackage ../../features/font {};
                        };
                        imports = [
                                ../../features/nvim
                                ../../features/kitty
                                ../../features/zsh
                        ];
                        manual.manpages.enable = true;
                };
        };
}

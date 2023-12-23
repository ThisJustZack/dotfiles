{ inputs, outputs, lib, config, pkgs, ... }: {
        programs.vscode = {
                enable = true;

                extensions = with pkgs.vscode-extensions; [
                        ms-dotnettools.csharp
                ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
                /*
                        {
                                name = "";
                                publisher = "";
                                version = "";
                                sha256 = "";
                        }
                */
                ];
        };
}

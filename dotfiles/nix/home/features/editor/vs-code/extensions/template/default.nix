{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.editor.vs-code.extensions.csharp;

in {
        imports = [ ./extensions ];

        options.features.editor.vs-code.extensions.csharp = {
                enable = mkEnableOption "csharp";
        };
        config = mkIf cfg.enable {
                programs.vscode = {
                        extensions = with pkgs.vscode-extensions; [
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
        };
}

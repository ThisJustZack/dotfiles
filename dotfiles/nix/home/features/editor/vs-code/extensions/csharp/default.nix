{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.user.editor.vs-code.extensions.csharp;

in {
        imports = [ ./extensions ];

        options.features.user.editor.vs-code.extensions.csharp = {
                enable = mkEnableOption "csharp";
        };
        config = mkIf cfg.enable {
                programs.vscode = {
                        extensions = with pkgs.vscode-extensions; [
                                ms-dotnettools.csharp
                        ];
                };
        };
}

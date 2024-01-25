{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.editor.vs-code;

in {
        imports = [ ./extensions ];

        options.features.editor.vs-code = {
                enable = mkEnableOption "vs-code";
        };
        config = mkIf cfg.enable {
                programs.vscode = {
                        enable = true;
                };

                mkIf config.features.editor.godot.enable {
                        features.editor.vs-code.extensions.csharp.enable = true;
                };
        };
}

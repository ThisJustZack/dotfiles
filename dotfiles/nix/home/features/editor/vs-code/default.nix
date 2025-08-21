{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.user.editor.vs-code;

in {
        imports = [ ./extensions ];

        options.features.user.editor.vs-code = {
                enable = mkEnableOption "vs-code";
        };
        config = mkIf cfg.enable {
                programs.vscode = {
                        enable = true;
                };

                mkIf config.features.user.editor.godot.enable {
                        features.user.editor.vs-code.extensions.csharp.enable = true;
                };
        };
}

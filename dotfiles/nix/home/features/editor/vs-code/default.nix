{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.user.editor.vs-code;

in {
        imports = [ ./extensions ];

        options.features.user.editor.vs-code = {
                enable = mkEnableOption "vs-code";
        };
        config = mkMerge [
                (mkIf cfg.enable {
                        programs.vscode.enable = true;
                })

                (mkIf (cfg.enable && config.features.user.editor.godot.enable) {
                        features.user.editor.vs-code.extensions.csharp.enable = true;
                })
        ];
}

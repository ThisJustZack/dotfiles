{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.user.editor.vs-code;

in {
        options.features.user.editor.vs-code = {
                enable = mkEnableOption "vs-code";
        };
        config = mkIf cfg.enable {
                programs.vscode = {
                        enable = true;
                        profiles.default.extensions = with pkgs.vscode-extensions; [
                                ms-vscode-remote.remote-containers
                        ];
                };
        };
}

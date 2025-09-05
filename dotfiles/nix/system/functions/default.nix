{ lib, pkgs, config, ... }: {
        imports = [
                ./hasVirtualizationCapability
                ./isGamingMachine
        ];
}
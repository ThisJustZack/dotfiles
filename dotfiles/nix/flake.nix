{
        description = "Dotfiles configuration";

        inputs = {
                nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
                nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

                darwin = {
                        url = "github:lnl7/nix-darwin/master";
                        inputs.nixpkgs.follows = "nixpkgs";
                };

                home-manager = {
                        url = "github:nix-community/home-manager/release-23.05";
                        inputs.nixpkgs.follows = "nixpkgs";
                };
        };

        outputs = inputs@{ self, nixpkgs, darwin, home-manager, ... }: 
        let
                user = "zack";

                nixpkgsOverlays = import ./overlays { inherit inputs; };
                nixpkgsConfig = {
                        allowUnfree = true;
                        allowUnfreePredicate = (_: true);
                };
        in
        {
                # Darwin configuration entrypoint
                darwinConfigurations = {
                        "macbook" = darwin.lib.darwinSystem {
                                system = "aarch64-darwin";
                                modules = [
                                        ./system/darwin
                                        ./brew
                                        ({ pkgs, ... }: {
                                                nixpkgs.config = nixpkgsConfig;
                                                # nixpkgs.overlays = nixpkgsOverlays;

                                                nix = {
                                                        package = pkgs.nixFlakes;
                                                        settings = {
                                                                trusted-users = [ "${user}" ];
                                                                experimental-features = [ "nix-command" "flakes" ];
                                                        };
                                                };

                                                users.users.${user} = {
                                                        name = "${user}";
                                                        home = "/Users/${user}";
                                                        shell = pkgs.zsh;
                                                };
                                        })
                                        home-manager.darwinModules.home-manager {
                                                home-manager = {
                                                        extraSpecialArgs = { inherit inputs; };
                                                        users.${user} = import ./home/users/macbook;
                                                };
                                        }
                                ];
                        };
                };

                # Standalone home-manager configuration entrypoint
                homeConfigurations = {
                        "wsl" = 
                        let
                                system = "x86_64-linux";
                                pkgs = import nixpkgs {
                                        inherit system;
                                        config = nixpkgsConfig;
                                        # overlays = nixpkgsOverlays;
                                };
                        in
                        home-manager.lib.homeManagerConfiguration {
                                inherit pkgs;
                                extraSpecialArgs = { inherit inputs; };
                                modules = [
                                        ./home/users/wsl
                                ];
                        };
                };
        };
}

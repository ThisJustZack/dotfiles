{
        description = "Dotfiles configuration";

        inputs = {
                nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
                nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
                nixpkgs-darwin.url = "github:nixos/nixpkgs/nixpkgs-25.05-darwin";

                darwin = {
                        url = "github:nix-darwin/nix-darwin/nix-darwin-25.05";
                        inputs.nixpkgs.follows = "nixpkgs-darwin";
                };

                home-manager = {
                        url = "github:nix-community/home-manager/release-25.05";
                        inputs.nixpkgs.follows = "nixpkgs";
                };
        };

        outputs = inputs@{ self, nixpkgs, darwin, home-manager, ... }: 
        let 
                inherit (self) outputs;
                user = "zack";

                nixpkgsOverlays = import ./overlays { inherit inputs outputs; };
                nixpkgsConfig = {
                        allowUnfree = true;
                        allowUnfreePredicate = (_: true);
                };
        in
        {
                # Nix configuration entrypoint
                nixosConfigurations = {
                        "zack" = nixpkgs.lib.nixosSystem {
                                system = "x86_64-linux";
                                modules = [
                                        /etc/nixos/hardware-configuration.nix
                                        ./system/os/nixos
                                        ({ pkgs, ... }: {
                                                nixpkgs.config = nixpkgsConfig;
                                                #nixpkgs.overlays = nixpkgsOverlays;

                                                nix = {
                                                        package = pkgs.nixVersions.stable;
                                                        settings = {
                                                                trusted-users = [ "${user}" ];
                                                                experimental-features = [ "nix-command" "flakes" ];
                                                        };
                                                };

                                                users.users.${user} = {
                                                        description = "${user}";
                                                        extraGroups = [ "networkmanager" "wheel" ];
                                                        isNormalUser = true;
                                                        shell = pkgs.zsh;
                                                        ignoreShellProgramCheck = true;
                                                };
                                        })
                                        home-manager.nixosModules.home-manager {
                                                home-manager = {
                                                        extraSpecialArgs = { inherit inputs; };
                                                        users.${user} = import ./home/users/nix-desktop;
                                                };
                                        }
                                ];
                        };
                };

                # Darwin configuration entrypoint
                darwinConfigurations = {
                        "macbook" = darwin.lib.darwinSystem {
                                system = "aarch64-darwin";
                                modules = [
                                        { nix.enable = false;
                                          system.primaryUser = "zack"; }
                                        ./system/os/darwin
                                        ./brew
                                        ({ pkgs, ... }: {
                                                nixpkgs.config = nixpkgsConfig;
                                                # nixpkgs.overlays = nixpkgsOverlays;

                                                nix = {
                                                        package = pkgs.nixVersions.stable;
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

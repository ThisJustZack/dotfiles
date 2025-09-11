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

                nixpkgsConfig = {
                        allowUnfree = true;
                        allowUnfreePredicate = (_: true);
                };

                nixpkgsOverlays = import ./overlays { inherit inputs outputs nixpkgsConfig; };

                nixosUsers = [ "zack" ];

                mkNixos = name:
                        nixpkgs.lib.nixosSystem {
                                system = "x86_64-linux";
                                specialArgs = {
                                        user = name;
                                        inherit inputs;
                                };

                                modules = [
                                        /etc/nixos/hardware-configuration.nix
                                        ./system/os/nixos

                                        ({ pkgs, user, ... }: {
                                                nixpkgs.config = nixpkgsConfig;
                                                nixpkgs.overlays = nixpkgsOverlays;

                                                nix = {
                                                        package = pkgs.nixVersions.stable;
                                                        settings = {
                                                                trusted-users = [ user ];
                                                                experimental-features = [ "nix-command" "flakes" ];
                                                        };
                                                };

                                                users.users.${user} = {
                                                        description = user;
                                                        extraGroups = [ "wheel" ];
                                                        linger = true;
                                                        isNormalUser = true;
                                                        ignoreShellProgramCheck = true;
                                                };
                                        })

                                        home-manager.nixosModules.home-manager
                                        ({ user, ... }: {
                                                home-manager = {
                                                        extraSpecialArgs = { inherit inputs user; };
                                                        useGlobalPkgs = true;
                                                        users.${user} = import ./home/users/nix-desktop;
                                                };
                                        })
                                ];
                        };

                darwinUsers = {
                        macbook = "zack";
                };

                mkDarwin = name:
                        let user = darwinUsers.${name};
                        in darwin.lib.darwinSystem {
                                system = "aarch64-darwin";
                                specialArgs = {
                                        inherit inputs user;
                                };

                                modules = [
                                        {
                                                nix.enable = false;
                                                system.primaryUser = user;
                                        }

                                        ./system/os/darwin
                                        ./brew

                                        ({ pkgs, user, ... }: {
                                                nixpkgs.config = nixpkgsConfig;
                                                nixpkgs.overlays = nixpkgsOverlays;

                                                nix = {
                                                        package = pkgs.nixVersions.stable;
                                                        settings = {
                                                                trusted-users = [ user ];
                                                                experimental-features = [ "nix-command" "flakes" ];
                                                        };
                                                };

                                                users.users.${user} = {
                                                        name = user;
                                                        home = "/Users/${user}";
                                                        shell = pkgs.zsh;
                                                };
                                        })

                                        home-manager.darwinModules.home-manager
                                        {
                                                home-manager = {
                                                        extraSpecialArgs = { inherit inputs user; };
                                                        users.${user} = import ./home/users/macbook;
                                                };
                                        }
                                ];
                        };
        in
        {
                # NixOS entrypoint
                nixosConfigurations =
                        nixpkgs.lib.genAttrs nixosUsers mkNixos;

                # Darwin entrypoint
                darwinConfigurations =
                        nixpkgs.lib.genAttrs (builtins.attrNames darwinUsers) mkDarwin;

                # Standalone Home-Manager entrypoint
                homeConfigurations = {
                        wsl =
                                let
                                        system = "x86_64-linux";
                                        pkgs = import nixpkgs {
                                                inherit system;
                                                config = nixpkgsConfig;
                                                overlays = nixpkgsOverlays;
                                        };
                                in
                                home-manager.lib.homeManagerConfiguration {
                                        inherit pkgs;
                                        extraSpecialArgs = { inherit inputs; };
                                        modules = [ ./home/users/wsl ];
                                };
                };
        };
}

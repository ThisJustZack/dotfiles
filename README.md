[![built with nix](https://builtwithnix.org/badge.svg)](https://builtwithnix.org)

This is my dotfile configuration that is used across all of my systems that have some flavor of Linux. It utilizes the [Nix ecosystem](https://www.nixos.wiki/wiki/Nix_Ecosystem) to have declarative, reproducible environments for each system to make the only consideration be how stable a system should be.

## **Content**

- ``Operating System``: MacOS, Linux-derived operating systems
- ``Window Manager``: Default
- ``Terminal``: kitty
- ``Shell``: zsh
- ``Editor``: neovim
- ``Font``: Fira Code

## **Structure**

- ``system``: Shared system configuration entrypoints between NixOS, MacOS, and other Linux-derived operating systems
- ``home``: User-defined environments (``home/users``) with applications and their respective configurations (``home/features``)
- ``pkgs``: Custom packages written for use in ``home``
- ``overlays``: Overlays for nixpkgs and overwritten packages for custom builds

## **Install Dependencies**

If using WSL with a non-NixOS distribution, follow this [guide](https://devblogs.microsoft.com/commandline/systemd-support-is-now-available-in-wsl/#how-can-you-get-systemd-on-your-machine) to enable systemd.

If using NixOS, there are no steps to follow currently.

Install ``nix`` with the following command.
```bash
sh <(curl -L https://nixos.org/nix/install)
```

This configuration uses a template flake for simplifying cloning so that it only requires the ``nix`` command.
```bash
nix --extra-experimental-features "nix-command flakes" flake init -t github:Eyryse/dotfiles#dotfiles
```

After this, make a symbolic link to ``~/.config/nix`` using the following command.
```bash
ln -s "$(pwd)/nix" ~/.config/nix
```
- If the ``~/.config`` directory does not exist, use the following command to create it.
```bash
mkdir ~/.config
```

Now, follow the instructions according to the OS of the system.

## *MacOS*

Add the ``home-manager`` Nix upstream to the system.
```bash
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
```

Install XCode CLI tools.
```bash
xcode-select --install
```

Use the ``nix-darwin`` Nix installer.
```bash
nix-build https://github.com/LnL7/nix-darwin/archive/master.tar.gz -A installer
./result/bin/darwin-installer
```
- This runs the [shell commands](https://github.com/LnL7/nix-darwin/blob/master/pkgs/darwin-installer/default.nix) to configure the system for ``nix-darwin``.

## *Linux*

Add the ``home-manager`` Nix upstream to the system.
```bash
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
```
Install ``home-manager`` using the Nix upstream added.
```bash
nix-shell '<home-manager>' -A install
```

## **Install Profiles**

Now that the dependencies have been installed, the profiles established in [``flake.nix``](https://github.com/Eyryse/dotfiles/blob/main/dotfiles/nix/flake.nix) can be installed.

## *MacOS*

Run these commands to build the Darwin configuration for ``macbook``.
```bash
cd $HOME/.config/nix
nix --experimental-features "nix-commands flakes" build .#darwinConfigurations.macbook.system
./result/sw/bin/darwin-rebuild switch --flake .#macbook
rm -rf ./result
```

## **TODO**

- Yabai and SKHD configuration for MacOS
- Add profile shell scripts into a ``bin`` folder to make profile installs simpler

[![built with nix](https://builtwithnix.org/badge.svg)](https://builtwithnix.org)

This is my dotfile configuration that is used across all of my systems that have some flavor of Linux. It utilizes the [Nix ecosystem](https://www.nixos.wiki/wiki/Nix_Ecosystem) to have declarative, reproducible environments for each system to make the only consideration be how stable a system should be.

## **Content**

- ``Operating System``: MacOS, Linux-derived operating systems
- ``Window Manager``: Yabai (MacOS), Default
- ``Terminal``: kitty
- ``Shell``: zsh
- ``Editor``: neovim, VS Code
- ``Font``: Fira Code

## **Structure**

- ``bin``: Profile management shell scripts
- ``system``: Shared system configuration entrypoints between NixOS, MacOS, and other Linux-derived operating systems
- ``home``: User-defined environments (``home/users``) with applications and their respective configurations (``home/features``)
- ``brew``: Homebrew configuration and environment for MacOS
- ``pkgs``: Custom packages written for use in ``home``
- ``overlays``: Overlays for nixpkgs and overwritten packages for custom builds

## **Install Dependencies**

Install ``nix`` with the following command.
```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```
- The source of this is maintained in the following [repository](https://github.com/DeterminateSystems/nix-installer).

This configuration uses a template flake for simplifying cloning so that it only requires the ``nix`` command.
```bash
nix --experimental-features "nix-command flakes" flake init -t github:Eyryse/dotfiles#dotfiles
```

After this, make a symbolic link to ``~/.config/nix`` using the following command.
```bash
mkdir -p ~/.config && ln -s "$(pwd)/nix" ~/.config/nix
```

Now, continue the following instructions according to the OS of the system.

### *Standalone Linux*

Add the ``home-manager`` Nix upstream to the system.
```bash
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
```

Install ``home-manager`` using the Nix upstream added.
```bash
nix-shell '<home-manager>' -A install
```

Change the pretty hostname of the system with ``hostnamectl``.
```bash
hostnamectl set-hostname wsl --pretty
```
- It is assumed that systemd is enabled on the system. To enable it in WSL, follow this [guide](https://devblogs.microsoft.com/commandline/systemd-support-is-now-available-in-wsl/#how-can-you-get-systemd-on-your-machine).

### *MacOS*

Install ``XCode CLI tools`` to the system.
```bash
xcode-select --install
```

Install ``homebrew`` to the system.
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Change the local hostname of the system using ``scutil``.
```bash
sudo scutil -set LocalHostName macbook
```

### *NixOS*

There are currently no steps to follow. The ``bin`` files are capable of having a configuration should the [``nixos-build``](https://github.com/Eyryse/dotfiles/blob/main/dotfiles/nix/bin/build-profiles/nixos-build) script be maintained.

## **Install Profiles**

Now that the dependencies have been installed, the profiles established within [``flake.nix``](https://github.com/Eyryse/dotfiles/blob/main/dotfiles/nix/flake.nix) from the template can be installed.

This is streamlined through a [script](https://github.com/Eyryse/dotfiles/blob/main/dotfiles/nix/bin/build) found in ``bin``.
```bash
~/.config/nix/bin/build
```
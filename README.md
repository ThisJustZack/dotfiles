[![built with nix](https://builtwithnix.org/badge.svg)](https://builtwithnix.org)

This is my dotfile configuration that is used across all of my systems that have some flavor of Linux. It utilizes the [Nix ecosystem](https://www.nixos.wiki/wiki/Nix_Ecosystem) to have declarative, reproducible environments for each system to make the only consideration be how stable a system should be.

## **Content**

- ``Operating System``: MacOS, NixOS, Linux-derived operating systems
- ``Window Manager``: Default (MacOS), KDE Plasma (NixOS), Default (Linux)
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

Install ``nix`` with the following command if it is not installed already.
```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```
> [!NOTE]
> The source of this is maintained in the following [repository](https://github.com/DeterminateSystems/nix-installer).

This configuration uses a template flake for simplifying cloning so that it only requires the ``nix`` command.
```bash
nix --experimental-features "nix-command flakes" flake init -t github:ThisJustZack/dotfiles#dotfiles
```

After retrieving the clone, make the config directory and move the dotfiles using the following command.
```bash
rm -rf ~/.config/nix && mkdir -p ~/.config/nix && mv nix/* ~/.config/nix && rm -rf nix
```

Now, continue the following instructions according to the OS of the system.

### *Standalone Linux*

Change the pretty hostname of the system with ``hostnamectl``.
```bash
hostnamectl set-hostname wsl --pretty
```
> [!IMPORTANT]
> It is assumed that systemd is enabled on the system. To enable it in WSL, follow this [guide](https://devblogs.microsoft.com/commandline/systemd-support-is-now-available-in-wsl/#how-can-you-get-systemd-on-your-machine).

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

There are no additional instructions to follow currently.

## **Install Profiles**

Now that the dependencies have been installed, the profiles established within [``flake.nix``](https://github.com/ThisJustZack/dotfiles/blob/main/dotfiles/nix/flake.nix) from the template can be installed.

This is streamlined through a [script](https://github.com/ThisJustZack/dotfiles/blob/main/dotfiles/nix/bin/build) found in ``bin``. It is executed with the following command.
```bash
~/.config/nix/bin/build
```
> [!IMPORTANT]
> Within NixOS, it should be executed with the following command currently.
> ```bash
> ~/.config/nix/bin/build zack
> ```
> This may be changed to where it is internal and uses the following as a build profile.
> ```bash
> "$(whoami)@$(hostnamectl --static)"
> ```

> [!WARNING]
> If any of the scripts have a ``Permission denied`` message, use the following command to grant permission.
> ```bash
> chmod 755 ~/.config/nix/bin/build && chmod 755 ~/.config/nix/bin/build-profiles/*
> ```

> [!WARNING]
> On MacOS, ``nix-darwin`` may want to repopulate the ``/etc/bashrc`` or other configuration files but be unable to and error, in which case the following command should be used or adapted accordingly.
> ```bash
> sudo mv /etc/bashrc /etc/bashrc.before-nix-darwin
> ```
[![built with nix](https://builtwithnix.org/badge.svg)](https://builtwithnix.org)

This is my dotfile configuration that is used across all of my systems that have some flavor of Linux. It utilizes the [Nix ecosystem](https://www.nixos.wiki/wiki/Nix_Ecosystem) to have declarative, reproducible environments for each system to make the only consideration be how secure a system should be.

## Content

- ``Operating System``: MacOS, Linux-derived operating systems
- ``Window Manager``: Default (will switch to Yabai in the future)
- ``Terminal``: Kitty
- ``Shell``: zsh
- ``Editor``: neovim
- ``Font``: Fira Code

## Structure

- ``system``: Shared system configuration entrypoints between NixOS, MacOS, and other Linux-derived operating systems
- ``home``: User-defined environments (``home/users``) with applications and their respective configurations (``home/features``)
- ``pkgs``: Custom packages written for use in ``home``
- ``overlays``: Overlays for nixpkgs and overwritten packages for custom builds

## Requirements

The only requirement is to have [Nix](https://www.nixos.org/download.html) installed with the experimental ``nix-command`` and ``flakes`` features opted into.

To opt into the experimental ``nix-command`` and ``flakes`` features temporarily, this command can be used.

```bash
export NIX_CONFIG="experimental-features = nix-command flakes"
```

## Install

This configuration uses a template flake for fast imports that only require the ``nix`` command.

```bash
nix flake init -t github:Eyryse/dotfiles#dotfiles
```

After this, make a symbolic link to ``~/.config/nix`` using the following command.

```bash
ln -s dotfiles/nix ~/.config/nix
```
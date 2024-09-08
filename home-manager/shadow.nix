{ config, lib, pkgs, ... }:
{
  home.stateVersion = "24.05";

  home.packages = with pkgs; [
    cowsay
    ffmpeg
    fortune
    htop
    nb
    neovim
    (pkgs.nerdfonts.override {
      fonts = [
        "FiraCode"
        "Hack"
        "Meslo"
        "RobotoMono"
      ];
    })
    tree
  ];

  nixpkgs.config.allowUnfree = true;

  imports = [
    ./programs/awscli.nix
    ./programs/bash.nix
    ./programs/bat.nix
    ./programs/direnv.nix
    ./programs/eza.nix
    ./programs/git.nix
    ./programs/jq.nix
    ./programs/nix-index.nix
    ./programs/starship.nix
    ./programs/tmux.nix
    ./programs/zsh.nix
  ];

  programs.home-manager.enable = true;
}


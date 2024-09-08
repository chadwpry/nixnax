{ config, lib, pkgs, ... }:
{
  home.stateVersion = "24.05";

  home.packages = with pkgs; [
    cowsay
    ffmpeg
    fortune
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
    ./programs/fastfetch.nix
    (import ./programs/git.nix {
      gitUser = "Chad W Pry";
      gitEmail = "chad.pry@gmail.com";
    })
    ./programs/htop.nix
    ./programs/jq.nix
    ./programs/less.nix
    ./programs/lesspipe.nix
    ./programs/nix-index.nix
    ./programs/pandoc.nix
    ./programs/readline.nix
    ./programs/ripgrep.nix
    ./programs/starship.nix
    ./programs/tmux.nix
    ./programs/zsh.nix
  ];

  programs.home-manager.enable = true;
}


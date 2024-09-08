{ config, lib, pkgs, ... }:
{
  environment = {
    variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      PAGER = "less";
      LESS = "-eFRX";
    };

    systemPackages = with pkgs; [
      bat
      curl
      eza
      git
      htop
    ];
  };

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };

  programs.zsh.enable = true;
}

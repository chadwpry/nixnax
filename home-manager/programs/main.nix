{ config, pkgs, ... }:
  let
    nerdfonts = (pkgs.nerdfonts.override {
      fonts = [
        "FiraCode"
        "Hack"
        "Meslo"
        "RobotoMono"
      ];
    });
  in {
    # Packages that should be installed to the user profile.
    home.packages = with pkgs; [
      # cmake
      # docker-compose
      cowsay
      ffmpeg
      fortune
      # glib
      # gnupg
      # gpgme
      # libiconv
      nb
      neovim
      nerdfonts
      # openssl
      # openssl.dev
      # pkg-config
      # rustup
      # streamlink
      tree
      # w3m
      # watch
      # watchman
      # websocat
      # weechat
    ];

    home.stateVersion = "24.05";

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;

    programs.awscli = {
      enable = true;
    };

    programs.bat = {
      enable = true;
    };

    programs.fastfetch = {
      enable = true;
    };

    programs.go = {
      enable = true;
    };

    programs.htop = {
      enable = true;
    };

    programs.jq = {
      enable = true;
    };

    programs.less = {
      enable = true;
    };

    programs.lesspipe = {
      enable = true;
    };

    programs.pandoc = {
      enable = true;
    };

    programs.readline = {
      enable = true;
    };

    programs.ripgrep = {
      enable = true;
    };

    # services.gpg-agent = {
    #   enable = true;
    #   defaultCacheTtl = 1800;
    #   enableSshSupport = true;
    # };
  }

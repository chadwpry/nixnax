{ ... }: {
  homeModules = {
    common = {
      imports = [
        ./home/main.nix
        ./home/bash.nix
        ./home/git.nix
        ./home/starship.nix
        ./home/tmux.nix
        ./home/zsh.nix
      ];


      home-manager.backupFileExtension = "bak-hm";
      home-manager.useUserPackages = true;
      home-manager.verbose = false;
    };

    linux = {
      xsession.enable = true;
    };

    darwin = {
      targets.darwin.search = "Bing";
    };
  };
}

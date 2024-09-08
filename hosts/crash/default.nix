{ config, lib, pkgs, nixpkgs, ... }:
{
  imports = [
    ./locale.nix
  ];

  networking = {
    hostName = "crash";
  };

  nix = {
    # daemonCPUSchedPolicy = "batch";
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  nixpkgs.hostPlatform = "x86_64-linux";

  services = {
    netdata.enable = true;
  };

  system.stateVersion = "24.05";

  users = {
    defaultUserShell = pkgs.zsh;

    users.shadow = {
      description = "Chad W Pry";
      extraGroups = [ "docker" "networkmanager" "wheel" ];
      isNormalUser = true;
    };
  };

  wsl = {
    defaultUser = "shadow";
    enable = true;
  };
}

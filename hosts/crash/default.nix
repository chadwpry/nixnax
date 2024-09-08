{ config, lib, pkgs, nixpkgs, ... }:
{
  imports = [
    ./locale.nix
  ];

  networking = {
    networkingmanager = true;
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
    openssh.enable = true;
  };

  system.stateVersion = "24.05";

  users.users.shadow.isNormalUser = true;

  wsl = {
    defaultUser = "shadow";
    enable = true;
  };
}



{ config, pkgs, ... }:
{
  users = {
    defaultUserShell = pkgs.zsh;

    users.shadow = {
      isNormalUser = true;
      description = "Chad W Pry";
      extraGroups = [ "docker" "networkmanager" "wheel" ];
    };
  };
}

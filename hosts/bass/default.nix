{ config, lib, pkgs, nixpkgs, ... }:
{
  imports = [
    ./locale.nix
  ];

  networking = {
    hostName = "bass";
  };

  nix = {
    useDaemon = true;
    gc = {
      automatic = true;
      interval = {
        Weekday = 0;
        Hour = 0;
        Minute = 0;
      };
      options = "--delete-older-than 7d";
    };
  };

  nixpkgs.hostPlatform = "aarch64-darwin";

  security.pam.enableSudoTouchIdAuth = true;

  services.nix-daemon = {
    enable = true;
    enableSocketListener = true;
  };

  users = {
    users.shadow = {
      description = "Chad W Pry";
      home = "/Users/shadow";
    };
  };

  # https://github.com/LnL7/nix-darwin/tree/master/modules/system/defaults
  system = {
    activationScripts = {
      postUserActivation.text = ''
        # Following line should allow us to avoid a logout/login cycle
        /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
      '';
    };
    defaults.dock = {
      autohide = false;
      orientation = "bottom";
      # wvous-br-corner = 4;
    };
    defaults.finder = {
      AppleShowAllExtensions = true;
      FXPreferredViewStyle = "clmv";
      QuitMenuItem = true;
      ShowPathbar = true;
      ShowStatusBar = true;
    };
    defaults.loginwindow = {
      GuestEnabled = false;
    };
    defaults.menuExtraClock = {
      Show24Hour = true;
      # ShowDate = 0;
    };
    defaults.NSGlobalDomain = {
      AppleShowAllExtensions = true;
      AppleKeyboardUIMode = 3;
      InitialKeyRepeat = 10;
      KeyRepeat = 1;
      # NSNavPanelExpandedStateForSaveMode = true;
      # NSNavPanelExpandedStateForSaveMode2 = true;
      # PMPrintingExpandedStateForPrint = true;
      # PMPrintingExpandedStateForPrint2 = true;
    };
    defaults.spaces = {
      # By default (false) each display has its own space
      # Enable (true) to have one space across all displays
      spans-displays = false;
    };
  };

  system.stateVersion = 4;
}


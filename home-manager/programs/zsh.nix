{ config, ... }: {
  programs.zsh = {
    autosuggestion.enable = true;
    enable = true;
    enableCompletion = true;
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    sessionVariables = {
      EDITOR = "nvim";
      PROMPT = "%F{green}%*%f %F{cyan}%~%f %F{red}%f$ ";
    };
    shellAliases = {
      ls = "ls --color=auto";
    };
    syntaxHighlighting.enable = true;
    zplug = {
      enable = true;
      plugins = [
        {
          name = "zsh-users/zsh-autosuggestions";
        }
      ];
   };

    initExtra = ''
      # set mode to vi
      bindkey -v

      echo -ne '\033]0;New Window\a'

      settitle() {
        echo -ne '\033]0;'"$1"'\a'
      }
    '';
  };
}

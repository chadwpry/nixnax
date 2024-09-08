{ ... }: {
  programs.eza = {
    enable = true;
    extraOptions = [
      "--all"
      "--classify"
      "--long"
      "--header"
      "--time-style=long-iso"
    ];
    git = true;
    icons = true;
  };
}

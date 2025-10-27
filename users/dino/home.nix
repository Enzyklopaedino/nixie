{ config, pkgs, inputs, ... }:

{
  home.username = "dino";
  home.homeDirectory = "/home/dino";

  imports = [
	./../../modules/browsers
  ];
  
  home.packages = with pkgs; [
    # archives
    zip
    unzip

    #entertainment
    spotify

    # utils
    ripgrep # recursively searches directories for a regex pattern
    jq # A lightweight and flexible command-line JSON processor
    eza # A modern replacement for ‘ls’
    zoxide
    neovim

    btop  # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    pciutils # lspci
  ];

  programs.git = {
    enable = true;
    userName = "Enzyklopaedino";
    userEmail = "dino2mail2@gmail.com";
  };

 
  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.05";
}

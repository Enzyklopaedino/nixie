{ config, pkgs, ... }:

{
  # TODO please change the username & home directory to your own
  home.username = "dino";
  home.homeDirectory = "/home/dino";

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  
  # Packages that should be installed to the user profile.
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

  # basic configuration of git, please change to your own
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

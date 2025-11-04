{ ... }:

{
  imports = [
    ./editor.nix
    ./shell.nix
    ./ghostty.nix
    ./development.nix
  ];
  
  # home.file.".ssh/id_ed25519.pub" = {
  #   enable = true;
  #   source = ../dots/ssh/id_ed25519.pub;
  #   target = ".ssh/id_ed25519.pub";
  # };
 }

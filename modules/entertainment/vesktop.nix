{ pkgs, ... }:

{
  home = {
    packages = [ pkgs.vesktop ];

    file = {
      ".config/vesktop/settings.json" = {
        enable = true;
        source = ./../../dots/vesktop/settings.json;
        target = ".config/vesktop/settings.json";
      };
      ".config/vesktop/settings/settings.json" = {
        enable = true;
        source = ./../../dots/vesktop/settings/settings.json;
        target = ".config/vesktop/settings/settings.json";
      };
    };
  };
}

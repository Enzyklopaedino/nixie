{
  pkgs,
  pkgs-unstable,
  ...
}:

{
  programs.bun = {
    enable = true;
  };

  programs.go = {
    enable = true;
    package = pkgs-unstable.go_1_24;
  };

  home.packages = [
    # nix-related
    pkgs.nixd
    pkgs.nixfmt-rfc-style

    pkgs-unstable.gnumake
    pkgs-unstable.gcc

    # go-related
    pkgs-unstable.delve
    pkgs-unstable.gopls

    # java-related
    # pkgs.zulu21

    # scala-related
    # pkgs-unstable.scala
    # pkgs-unstable.sbt
    # pkgs-unstable.metals
    # pkgs-unstable.coursier

    # nodejs-related
    pkgs.nodejs
   
    # git-related
    pkgs.git-lfs

    # obsidian
    pkgs-unstable.markdown-oxide

    # sqlc
    pkgs.sqlc
  ];
}

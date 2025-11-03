{
  inputs,
  pkgs,
  ...
}:

{
  # neovim
  programs.neovim = {
    enable = true;
    package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;

    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    extraPackages = with pkgs; [
      # Tools
      sqlite
      gcc
      # gnumake
      ripgrep

      # Nix
      nixd
      nixfmt-rfc-style # formatter

      # Go
      delve # debugger
      gopls # language server

      # Lua
      lua-language-server

      # TypeScript
      nodejs
      nodePackages.typescript-language-server
      tailwindcss-language-server

      # YAML
      yaml-language-server
    ];
  };

  # nvim config directory
  home.file.".config/nvim" = {
    enable = true;
    source = ./../../dots/nvim;
    target = ".config/nvim";
  };
}


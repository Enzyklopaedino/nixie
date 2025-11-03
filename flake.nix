{
description = "My smol flake";


inputs = { 
# external dependencies
  nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  # nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
 
 ghostty.url = "github:ghostty-org/ghostty";

 home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

    catppuccin.url = "github:catppuccin/nix/release-25.05";
    catppuccin-where-is-my-sddm-theme.url = "github:catppuccin/where-is-my-sddm-theme";
};


  outputs = { self, nixpkgs, home-manager, nur, ghostty, neovim-nightly-overlay, catppuccin, ... }@inputs:
  let 
  	system = "x86_64-linux";
      	pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [
          nur.overlay
        ];
      };
	# pkgs-unstable = import nixpkgs-unstable {
	#            inherit system;
	#
	#            config = {
	#              allowUnfree = true;
	#            };
	#          };
	#          specialArgs = {
	#            inherit inputs pkgs-unstable;
	#          };
      in {
  nixosConfigurations.nixhost = nixpkgs.lib.nixosSystem {
  inherit system;
  specialArgs = { inherit inputs pkgs; }; 

      modules = [
        ({ config, pkgs, ... }: {
            hardware.enableAllFirmware = true;
          })
        ./configuration.nix


        home-manager.nixosModules.home-manager
                  {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

	    home-manager.extraSpecialArgs = { inherit ghostty inputs pkgs neovim-nightly-overlay; };
	    home-manager.users.dino = nixpkgs.lib.mkDefault (
	    import ./users/dino/home.nix
	    );
          }
      ];
  };
};
}

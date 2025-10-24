{
description = "My smol flake";


inputs = { 
# external dependencies
  nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
 home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs";
    };
};


  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
  nixosConfigurations.nixhost = nixpkgs.lib.nixosSystem {
      modules = [
        ({ config, pkgs, ... }: {
            nixpkgs.config.allowUnfree = true;

            # Your usual system config
            hardware.enableAllFirmware = true;
          })
        ./configuration.nix
        home-manager.nixosModules.home-manager
                  {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.dino = import ./home.nix;
          }
      ];
  };
};
}

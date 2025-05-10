{
  description = "NixOS configuration with separate user packages";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    # Add mozilla overlay as an input
    mozilla = {
      url = "github:mozilla/nixpkgs-mozilla";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, mozilla, ... }:
    let
      system = "x86_64-linux";
      
      # Function to create overlay for unstable packages
      overlay-unstable = final: prev: {
        unstable = nixpkgs-unstable.legacyPackages.${system};
      };
      
      # Mozilla overlay for Firefox Nightly
      overlay-mozilla = final: prev: {
        mozilla = import "${mozilla}/firefox-overlay.nix" prev final;
      };
    in {
      # NixOS configuration
      nixosConfigurations.main = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit nixpkgs nixpkgs-unstable;
        };
        modules = [
          # Apply our overlays
          {
            nixpkgs.overlays = [ 
              overlay-unstable
              overlay-mozilla 
            ];

            # Important: Allow unfree packages explicitly here (for claude-code)
            nixpkgs.config.allowUnfree = true;            
          }
          
          # Import the base configuration
          ./configuration.nix
          
          # Add user packages configuration
          ./user-packages.nix
        ];
      };
    };
}

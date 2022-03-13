{
  description = "RedHat OpenShift Dedicated Flake";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/release-21.11";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    let
      overlay = final: prev: (import ./nix/overlay.nix) final prev;
    in flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ overlay ];
        };
      in {
        legacyPackages = pkgs;
        inherit (pkgs) devShell;
      }
    );
}

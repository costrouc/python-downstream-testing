let
  # use the latest in nixpkgs master
  pkgs = import (builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs-channels/archive/nixos-unstable.tar.gz";
  }) { config = { allowUnfree = true; }; };

  pythonPackages = pkgs.python3Packages.override {
    overrides = import ./overrides.nix;
  };
in pythonPackages

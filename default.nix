let
  # use the latest in nixpkgs master
  pkgs = import (builtins.fetchGit {
    url = "git@github.com:nixos/nixpkgs.git";
    ref = "master";
  }) { config = { allowUnfree = true; }; };

  pythonPackages = pkgs.python3Packages.override {
    overrides = import ./overrides.nix;
  };
in pythonPackages

{ pkgs ? import <nixpkgs> { } }:

let
  pythonPackages = pkgs.python3Packages.override {
    overrides = import ./overrides.nix;
  };
in {
  numpy = pythonPackages.numpy;

  scipy = pythonPackages.scipy;

  sympy = pythonPackages.sympy;

  matplotlib = pythonPackages.matplotlib;

  numba = pythonPackages.numba;
}

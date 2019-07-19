{ pkgs ? import <nixpkgs> { } }:

let
  pythonPackages = pkgs.python3Packages.override {
    overrides = import ./overrides.nix;
  };
in {
  numpy = pythonPackages.numpy;

  scipy = pythonPackages.scipy;

  dask = pythonPackages.dask;

  sympy = pythonPackages.sympy;

  matplotlib = pythonPackages.matplotlib;

  numba = pythonPackages.numba;

  xarray = pythonPackages.xarray;
}
